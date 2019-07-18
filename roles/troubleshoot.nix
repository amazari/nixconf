{ config, pkgs, ... }: {

  imports = [ ../base.nix ];

  programs.htop = {
    enable = true;
  };
  
  home.packages = with pkgs: [
    libva-utils
    intel-gpu-tools
    pkgs.pciutils
    powertop
    avahi
  };
}
