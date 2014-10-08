{ stdenv, fetchurl, unzip }:

{
    
  dev = stdenv.mkDerivation rec {
    version = "3.2.0";
    name = "bootstrap-${version}";

    src = fetchurl {
      url = "https://github.com/twbs/bootstrap-sass/archive/v${version}.tar.gz";
      sha256 = "1jk4yx3bvdhpqr8j12bc4ws66ayllrjlfncbz596l2g7n6c14pp6";
    };

    buildInputs = [ unzip ];
    
    installPhase = ''
      ls
      mkdir $out
      mv assets/* $out
    '';
  };
    
}