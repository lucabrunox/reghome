{ stdenv, sass, makeWrapper }:

stdenv.mkDerivation {
  name = "sass-wrapper";

  buildInputs = [ makeWrapper ];

  unpackPhase = "true";
  
  installPhase = ''
    mkdir $out
    for i in ${sass}/*; do
      ln -s $i $out/
    done
  '';
  
  setupHook = ./setup-hook.sh;
}