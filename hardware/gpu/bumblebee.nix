{ config, lib, pkgs, ... }: {

  imports = [ ./intel-common.nix
    ./nvidia-common.nix ];

  hardware.bumblebee.enable = true;
#  hardware.bumblebee.pmMethod = "switcheroo";
}
