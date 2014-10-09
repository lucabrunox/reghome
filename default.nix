{ pkgs ? (import <nixpkgs> {}), config ? {} }:

with pkgs;
let

  defaultPostgresConfig = pkgs.substituteAll {
    name = "postgres-config";
    src = ./services/postgres/postgresql.conf;
    hbaFile = ./services/postgres/pg_hba.conf;
    identFile = ./services/postgres/pg_ident.conf;
  };

  default = x: def: if x == null then def else x;
  
  makeConfig = { projectName ? "reghome",
                 flavor ? "dev",
                 nginx ? pkgs.nginx,
                 nginxConfigFile ? ./services/nginx/nginx.conf,
                 nginxExtraFlags ? null,
                 postgresql ? pkgs.postgresql93,
                 postgresDataDir ? null,
                 postgresFlags ? "",
                 postgresConfigFile ? defaultPostgresConfig }:
               {
                 inherit projectName flavor
                 nginx nginxConfigFile
                 postgresql postgresConfigFile postgresFlags;
                 nginxExtraFlags = default nginxExtraFlags "-p $HOME/.${projectName}/nginx";
                 postgresDataDir = default postgresDataDir "$HOME/.${projectName}/postgres/data";
               };
  config' = makeConfig config;

  backendPackages = callPackage ./pkgs/node-packages.nix { self = nodePackages // backendPackages; };

  backendPackages' = lib.collect lib.isDerivation backendPackages;

  sassWrapper = callPackage ./pkgs/sass-wrapper { sass = rubyLibs.sass; };

  frontendPackages = {
    reactjs = callPackage ./pkgs/reactjs.nix { };
    bootstrap-sass = callPackage ./pkgs/bootstrap-sass.nix { };
    jquery = callPackage ./pkgs/jquery.nix { };
  };

  frontendPackages' = lib.mapAttrs (_: value: value.${config'.flavor}) frontendPackages;

  baseName = "${config'.projectName}-${config'.flavor}";

  buildComponent = name: propagatedBuildInputs: installCommands:
    stdenv.mkDerivation {
      name = "${baseName}-${name}";

      phases = [ "installPhase" ];
      
      inherit propagatedBuildInputs;
      
      installPhase = ''
        mkdir $out
        ${installCommands}
      '';
    };

  components = with backendPackages; with frontendPackages'; rec {
    
    css = buildComponent "css" [ sassWrapper bootstrap-sass ] ''
      scss ${./client}/scss/main.scss:$out/main.css
    '';

    js = buildComponent "js" ([ nodejs ] ++ backendPackages') ''
      browserify -c jsx ${./client/js}/main.jsx > $out/bundle.js
    '';

    www = buildComponent "www" [] ''
      mkdir -p $out/js/
      ln -sv -T ${./client/index.html} $out/index.html
      ln -sv -T ${css} $out/css
      ln -sv ${js}/bundle.js $out/js/bundle.js
    '';
    
  };
in with backendPackages;

stdenv.mkDerivation ({
  name = "${baseName}";
  buildInputs = [ sassWrapper nodejs ] ++ backendPackages' ++ lib.attrValues frontendPackages';

  NODE_ENV = lib.optionalString (config'.flavor == "dev") "development";
  passthru = {
    inherit (components) www js css;
  };
  
} // config' // frontendPackages')
