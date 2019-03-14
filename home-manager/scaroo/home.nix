{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  nix.distributedBuilds = true;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
    (import /home/scaroo/code/nix/my_nixos_conf/overlays/emacs-nix-dev.nix)
    (import /home/scaroo/code/nix/my_nixos_conf/overlays/chromium-accelerated.nix)   
  ];

  #services.emacs = {
  #  enable = true;
  #};

  programs.command-not-found.enable = true;

  programs.bash = {
    enable = true;
    historyControl = ["erasedups"];
    shellAliases = {
     la = "ls -la";
     e = "emacs";
     ".." = "cd ..";
     ".-" = "cd -";
    };
  };

#  programs.emacs = {
#    enable = true;
#    #extraPackages = epkgs: [ epkgs.magit epkgs.nix-mode ];
#  };
  home.packages = [
    pkgs.alacritty
    pkgs.latte-dock
    pkgs.spotify
    pkgs.libva-utils
    pkgs.emacs
    pkgs.redshift-plasma-applet
    pkgs.chromium
    pkgs.intel-gpu-tools
  ];


  programs.git = {
    enable = true;
    userName  = "scaroo";
    userEmail = "scaroo@gmail.com";
  };

  programs.keychain.enable = true;
  programs.ssh = {
    enable = true;
    forwardAgent = true;
    #forwardX11 = true;
  };

  programs.htop = {
    enable = true;
  };
  
}
