{ config, lib, pkgs, ... }: {
  imports = [ ./nvidia-common.nix ];

  nixpkgs.config.allowUnfree = true;
  services.xserver.videoDrivers = [ "nvidia" ];
}
