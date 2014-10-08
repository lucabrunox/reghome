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
  };

  frontendPackages' = lib.mapAttrs (_: value: value.${config'.flavor}) frontendPackages;
  
in with backendPackages; with frontendPackages;

stdenv.mkDerivation ({
  name = "${config'.projectName}-${config'.flavor}";
  buildInputs = [ sassWrapper nodejs fibers pg expandenv forever express ] ++ lib.attrValues frontendPackages';

} // config' // frontendPackages')
