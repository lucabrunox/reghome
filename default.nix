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

      unpackPhase = "true";
      
      inherit propagatedBuildInputs;
      
      installPhase = ''
        mkdir $out
        ${installCommands}
      '';
    };

  components = with backendPackages; with frontendPackages'; rec {
    
    css = buildComponent "css" [ sassWrapper bootstrap-sass ] ''
      scss ${./assets/scss/main.scss}:$out/main.css
    '';
    
    static = buildComponent "static" [] ''
      mkdir -p $out/css $out/js
      ln -s ${css}/main.css $out/css/
      ln -s -T ${./static/index.html} $out/index.html
      ln -s ${bootstrap-sass}/share/js/bootstrap.js $out/js/
      ln -s -T ${jquery} $out/js/jquery.js
    '';
    
  };
in with backendPackages;

stdenv.mkDerivation ({
  name = "${baseName}";
  buildInputs = [ sassWrapper nodejs requirejs fibers pg express forever components.static ] ++ lib.attrValues frontendPackages';

  passthru = {
    inherit (components) static;
  };
  
} // config' // frontendPackages')
