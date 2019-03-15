{ config, lib, pkgs, ... }: {
  imports = [ ./nvidia-common.nix ];
  
  services.xserver.videoDrivers = [ "nvidia" ];
}
