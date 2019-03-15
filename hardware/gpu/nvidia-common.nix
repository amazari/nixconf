{config, lib, pkgs, ...}:
{
 boot.kernelPackages = pkgs.linuxPackages_4_20;
 hardware.opengl = {
  extraPackages = with pkgs; [
    vaapiVdpau
    libvdpau-va-gl
    ];
  };
}
