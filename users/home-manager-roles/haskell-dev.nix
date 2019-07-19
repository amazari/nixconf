{ config, pkgs, lib, ... }:


let
  emacsHaskellDev =
  ((import ../../packages/emacs-packages-sets.nix)
  { inherit pkgs; }).emacsHaskellDev;

in {
  imports = [ ./nix-devel.nix ];

  home.packages = with pkgs; [
    emacsHaskellDev
  ];
}
