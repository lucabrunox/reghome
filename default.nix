{ pkgs ? (import <nixpkgs> {}) }:

let
  projectName = "registrocasa";
  nodePackages = pkgs.nodePackages // (pkgs.callPackage ./pkgs/node-packages.nix { self = nodePackages; });
in with nodePackages; with pkgs;
{
  dev = stdenv.mkDerivation {
    name = "${projectName}-dev";
    buildInputs = [ nodejs fibers pg ];
  };
}
