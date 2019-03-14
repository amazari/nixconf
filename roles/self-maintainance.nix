{ config, pkgs, ... }:
{
  nix.gc.automatic = true;
  services.fstrim.enable = true;
  system.autoUpgrade.enable = true;
  nixpkgs.config.allowUnfree = true;
  services.fwupd.enable = true;
}
