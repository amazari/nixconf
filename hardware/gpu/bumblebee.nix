{ config, lib, pkgs, ... }: {

  hardware.bumblebee.enable = true;
  hardware.opengl = {
    extraPackages = with pkgs; [
      vaapiVdpau
      libvdpau-va-gl
      vaapiIntel
    ];
  };
}
