{ config, pkgs, ... }:
{
  users.users.kodi-user = {
    isNormalUser = true;
    uid = 1001;
  };

  
  services.xserver.enable = true;
  services.xserver.desktopManager.kodi.enable = true;
  nixpkgs.config.kodi.enableYatp = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.lightdm.greeter.enable = false;
  services.xserver.displayManager.lightdm.autoLogin = {
    enable = true;
    user = "kodi-user";
    timeout = 0;
  };

  nixpkgs.config.retroarch = { enableDolphin = true; enableMGBA = true; enableMAME = true;
 };
}
