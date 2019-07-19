{ config, pkgs, ... }: {

 # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

#  programs.keychain.enable = true;
  programs.ssh = {
    enable = true;
    forwardAgent = true;
#    forwardX11 = true;
  };

#  services.emacs = {
#    enable = true;
#  };

  programs.command-not-found.enable = true;

  programs.bash = {
    enable = true;
    historyControl = ["erasedups"];
    shellAliases = {
     la = "ls -la";
     sctl = "systemctl";
     emacsc = "emacsclient";
     };
  };

  home.packages = with pkgs; [
    unzip
    wget
    psmisc
  ];
}
