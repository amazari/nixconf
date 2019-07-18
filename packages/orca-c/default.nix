{ pkgs ? import <nixpkgs> {} }:

pkgs.callPackage ./derivation.nix { portmidiSupport = true;}
