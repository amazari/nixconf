let
  pkgs = import <nixpkgs> { };  
in
  pkgs.haskellPackages.callPackage ./kodi2nix.nix { }
