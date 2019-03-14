{ config, pkgs, ... }:
{
  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
  };

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "us";
    xkbOptions = "eurosign:e";

    # Enable touchpad support.
    libinput.enable = true;

    # Enable the KDE Desktop Environment.
    displayManager.sddm = {
      enable = true;
      enableHidpi = true;
    };
    desktopManager.plasma5.enable = true;
  };
  
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
      beignet
    ];
  };
}
