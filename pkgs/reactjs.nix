{ stdenv, fetchurl, unzip }:

{
    
  dev = stdenv.mkDerivation rec {
    name = "react-0.11.2";

    src = fetchurl {
      url = "http://facebook.github.io/react/downloads/${name}.zip";
      sha256 = "00az5z3f552bkv97ndr9m7qw10ssh1rn2qm91nw8nppxshi555i3";
    };

    buildInputs = [ unzip ];
    
    installPhase = ''
      mkdir $out
      mv build/* $out
    '';
  };
    
}