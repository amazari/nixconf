{ nixpkgs ? import <nixpkgs> {} }:
let
  inherit (nixpkgs) pkgs;
  inherit (pkgs) haskellPackages;

  emacsHaskellDev =
      ((import ../../packages/emacs-packages-sets.nix)
        { inherit pkgs; }).emacsHaskellDev;

  project = import ./release.nix;

in
  pkgs.stdenv.mkDerivation {
    shellHook = ''
alias nix-shell=""
'';
    name = "haskell-shell";
    buildInputs = project.env.nativeBuildInputs ++ [
      pkgs.man
      pkgs.nix
      haskellPackages.hlint
      haskellPackages.cabal2nix
      haskellPackages.cabal-install
      haskellPackages.hoogle
#      emacsHaskellDev
  ];
}
