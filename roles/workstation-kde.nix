{ config, pkgs, ... }:
{
  imports = [ ./graphical.nix ];
  # Enable the X11 windowing system.
  services.xserver.displayManager.sddm = {
      enable = true;
      enableHidpi = true;
    };
  services.xserver.desktopManager.plasma5.enable = true;
}
