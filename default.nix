{ pkgs ? (import <nixpkgs> {}), config ? {} }:

with pkgs;
let

  defaultPostgresConfig = pkgs.substituteAll {
    name = "postgres-config";
    src = ./services/postgres/postgresql.conf;
    hbaFile = ./services/postgres/pg_hba.conf;
    identFile = ./services/postgres/pg_ident.conf;
  };
 
  makeConfig = { projectName ? "registrocasa",
                 flavor ? "dev",
                 postgresql ? pkgs.postgresql93,
                 postgresDataDir ? "$HOME/.postgres/data",
                 postgresFlags ? "",
                 postgresPidFile ? "$HOME/.postgres/run/postgresql.pid",
                 postgresConfigFile ? defaultPostgresConfig }:
               { inherit projectName flavor postgresql postgresConfigFile postgresFlags postgresDataDir postgresPidFile; };
  config' = makeConfig config;

  backendPackages = callPackage ./pkgs/node-packages.nix { self = nodePackages // backendPackages; };

  frontendPackages = {
    reactjs = callPackage ./pkgs/reactjs.nix { };
    bootstrap-sass = callPackage ./pkgs/bootstrap-sass.nix { };
  };

  frontendPackages' = lib.mapAttrs (_: value: value.${config'.flavor}) frontendPackages;
  
  postgresql = pkgs.postgresql93;

in with backendPackages; with frontendPackages;

stdenv.mkDerivation ({
  name = "${config'.projectName}-dev";
  buildInputs = [ config'.postgresql rubyLibs.sass nodejs fibers pg ];

} // config' // frontendPackages')
