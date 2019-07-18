{config, lib, pkgs, ...}:
{
 boot.kernelPackages = pkgs.linuxPackages_5_1;
 hardware.opengl = {
  extraPackages = with pkgs; [
    vaapiVdpau
    libvdpau-va-gl
    ];
  };
}
