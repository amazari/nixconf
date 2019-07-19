{ config, pkgs, ... }:
 {
  imports = [
      ../hardware/machines/xps9550.nix
      ../roles/self-maintainance.nix
      ../users/scaroo-kde

      ../roles/avahi-nss.nix
      ../roles/workstation-kde.nix

      ../roles/flatpak-runner.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "xipi"; # Define your hostname.
    networkmanager.enable = true;
  };

  # Select internationalisation properties.
  i18n = {
    consoleFont = "latarcyrheb-sun32";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
#  environment.systemPackages = with pkgs; [
#    wget
#    emacs
#    powertop
#    avahi
#  ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  programs.ssh.forwardX11 = true;

  networking.firewall.enable = false;

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.03"; # Did you read the comment?

  nix.maxJobs = 6;
  nix.buildMachines = [ {
    hostName = "bamboo.local";
    sshUser = "scaroo";
    sshKey = "/root/.ssh/id_builders";
    system = "x86_64-linux";
    maxJobs = 12;
    speedFactor = 4;
    supportedFeatures = [ "big-parallel" ];
    mandatoryFeatures = [ ];
  }] ;
  nix.distributedBuilds = false;
  # optional, useful when the builder has a faster internet connection than yours
	nix.extraOptions = ''
		builders-use-substitutes = false
	'';
}
