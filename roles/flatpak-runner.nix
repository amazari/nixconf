{ config, lib, pkgs, ... }: {
  services.flatpak = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-kde ];
    };
}
