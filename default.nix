{ pkgs ? (import <nixpkgs> {})
, config ? {}
, nix-rehash ? import <nix-rehash>
}:

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
                 dataDir ? null,
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
                 dataDir = default dataDir ((builtins.getEnv "HOME")+"/.${projectName}");
                 nginxExtraFlags = default nginxExtraFlags "-p $HOME/.${projectName}/nginx";
                 postgresDataDir = default postgresDataDir "$HOME/.${projectName}/postgres/data";
               };
  config' = makeConfig config;

  deps = callPackage ./pkgs/node-packages.nix { self = nodePackages // deps; };

  depsList = lib.collect lib.isDerivation deps;

  baseName = "${config'.projectName}-${config'.flavor}";

  depsEnv = buildEnv {
    name = "${baseName}-deps";
    paths = depsList;
    pathsToLink = [ "/lib/node_modules" ];
    ignoreCollisions = true;
  };

  services = nix-rehash.reService {
    name = "${baseName}-services";
    configuration = let servicePrefix = "/tmp/${projectName}/services"; in [
      ({ config, pkgs, ...}: {
          services.postgresql.enable = true;
          services.postgresql.package = pkgs.postgresql93;
          services.postgresql.dataDir = "${config'.dataDir}/postgresql";
      })
    ];
  };
  
in

stdenv.mkDerivation ({
  name = "${baseName}";
  buildInputs = [ nodejs ] ++ depsList;

  NODE_ENV = lib.optionalString (config'.flavor == "dev") "development";
  passthru = { inherit depsEnv; };

  inherit depsEnv;
  
} // config')
