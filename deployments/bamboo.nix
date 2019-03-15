# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ../hardware/machines/bamboo-tower.nix

      ../roles/self-maintainance.nix
      ../users/scaroo-wheel.nix
      ../roles/avahi-nss.nix
    ];

#  nixpkgs.overlays = [
#    (import /home/scaroo/code/nix/my_nixos_conf/overlays/emacs-nix-dev.nix)
#    (import /home/scaroo/code/nix/my_nixos_conf/overlays/chromium-accelerated.nix)   
#  ];

  boot.kernelPackages = pkgs.linuxPackages_4_20;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "bamboo"; # Define your hostname.

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  nixpkgs.config.allowUnfree = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     wget emacs26-nox powertop
   ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.enable = false;

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.03"; # Did you read the comment?

}
