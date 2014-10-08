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
                 postgresql ? pkgs.postgresql93,
                 postgresDataDir ? "$HOME/.postgres/data",
                 postgresFlags ? "",
                 postgresPidFile ? "$HOME/.postgres/run/postgresql.pid",
                 postgresConfigFile ? defaultPostgresConfig }:
               { inherit projectName postgresql postgresConfigFile postgresFlags postgresDataDir postgresPidFile; };
  config' = makeConfig config;

  backendPackages = callPackage ./pkgs/node-packages.nix { self = nodePackages // backendPackages; });

  frontendPackages = {
    reactjs = callPackage ./pkgs/reactjs.nix { };
  };
  
  postgresql = pkgs.postgresql93;

in with backendPackages; with frontendPackages;

stdenv.mkDerivation ({
  name = "${config'.projectName}-dev";
  buildInputs = [ config'.postgresql nodejs fibers pg by-version."bindings"."1.2.1" ];

  buildPhase = ''
    
  '';
} // config' // backendPackages // frontendPackages);
