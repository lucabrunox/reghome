{ pkgs ? (import <nixpkgs> {})
, config ? {}
, nix-rehash ? import (if (builtins.tryEval <nix-rehash>).success then <nix-rehash> else ./nix-rehash)
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
    name = baseName;
    configuration = [
      ({ config, pkgs, ...}: {
          services.postgresql.enable = true;
          services.postgresql.package = pkgs.postgresql93;
          services.postgresql.dataDir = "${config'.dataDir}/postgresql";

          services.nginx.enable = true;
          services.nginx.stateDir = "${config'.dataDir}/nginx";
          services.nginx.user = builtins.getEnv "USER";
          services.nginx.group = builtins.getEnv "USER";
          services.nginx.httpConfig = ''
          	server {
              listen 0.0.0.0:8080;
		
              location / {
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header Host $http_host;
                proxy_set_header X-NginX-Proxy true;
			
                proxy_pass http://localhost:9090/;
                proxy_redirect off;
              }
            }
          '';

          supervisord.services.node = {
            command = "${nodejs}/bin/node ${./server}/main.js ${./server}/config.json";
          };
          
          supervisord.stateDir = "${config'.dataDir}/supervisor";
      })
    ];
  };

  cfg = services.config;
  
in

stdenv.mkDerivation ({
  name = "${baseName}";
  buildInputs = [ nodejs cfg.supervisord.bin cfg.services.postgresql.package ] ++ depsList;

  NODE_ENV = lib.optionalString (config'.flavor == "dev") "development";
  passthru = { inherit depsEnv; };

  inherit depsEnv;
  
} // config')
