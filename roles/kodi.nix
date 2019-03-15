{ config, pkgs, ... }:
{
  users.users.kodi-user = {
    isNormalUser = true;
    extraGroups = [ "audio" ];
    uid = 1001;
  };
  boot.plymouth.enable = true;
  hardware.pulseaudio.enable = true;
  services.xserver.enable = true;
  services.xserver.desktopManager.kodi.enable = true;
#  nixpkgs.config.kodi.enableControllers = true;
  nixpkgs.config.kodi.enableYatp = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.lightdm.greeter.enable = false;
  services.xserver.displayManager.lightdm.autoLogin = {
    enable = true;
    user = "kodi-user";
    timeout = 0;
  };

  environment.systemPackages = [ pkgs.retroarch ];
  nixpkgs.config.retroarch = { enableBsnes = true; enableDolphin = true; enableMGBA = true; enableMAME = true;
 };
}
