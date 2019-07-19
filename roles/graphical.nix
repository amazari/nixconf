{ config, pkgs, ...}:{


  # Enable sound.
 boot.plymouth.enable = true;
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
  };
}
