{ config, pkgs, ... }: {

  imports = [ ./base.nix ];
  nixpkgs.overlays = [ (import ../../overlays/emacs-nix-dev.nix) ];

  programs.htop = {
    enable = true;
  };

  home.packages = with pkgs; [
    libva-utils
    intel-gpu-tools
    pkgs.pciutils
    powertop
    avahi
    wget
    emacs26-nix-admin
  ];
}
