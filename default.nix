{ pkgs ? (import <nixpkgs> {})
, config ? {}
, nix-rehash ? import <nix-rehash>
}:

with pkgs;
let

  default = x: def: if x == null then def else x;
  
  makeConfig = { projectName ? "reghome",
                 flavor ? "dev",
                 dataDir ? null }:
               {
                 inherit projectName flavor;
                 dataDir = default dataDir ((builtins.getEnv "HOME") + "/.${projectName}/");
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
          services.nginx.group = "";
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
            command = "${nodejs}/bin/node %(ENV_PWD)s/server/main.js %(ENV_PWD)s/config.json";
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
