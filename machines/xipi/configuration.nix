{ config, pkgs, ... }:
 {
  imports = [
      ./xps9550-xipi.nix
      ../../roles/self-maintainance.nix
      ../../users/scaroo-wheel.nix
      ../../roles/avahi-nss.nix
      ../../roles/workstation-kde.nix
  ];

 nixpkgs.overlays = [
    (import /home/scaroo/code/nix/my_nixos_conf/overlays/emacs-nix-dev.nix)
    (import /home/scaroo/code/nix/my_nixos_conf/overlays/chromium-accelerated.nix)   
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.plymouth.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_4_20;

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
  environment.systemPackages = with pkgs; [
    wget
    emacs
    powertop
    avahi
  ];

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

  networking.hosts = {
    "192.168.0.20" = [ "bamboo" ];
  };
 
  nix.maxJobs = 0; 
  nix.buildMachines = [ {
    hostName = "bamboo";
    sshUser = "scaroo";
    sshKey = "/root/.ssh/id_builders";
    system = "x86_64-linux";
    maxJobs = 12;
    speedFactor = 4;
    supportedFeatures = [ "big-parallel" ];
    mandatoryFeatures = [ ];
  }] ;
  nix.distributedBuilds = true;
  # optional, useful when the builder has a faster internet connection than yours
	nix.extraOptions = ''
		builders-use-substitutes = false
	'';
}
