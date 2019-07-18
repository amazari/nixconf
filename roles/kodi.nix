{ config, pkgs, ... }:
{
  users.users.kodi = {
    isNormalUser = true;
    extraGroups = [ "audio" "wheel" ];
    uid = 1001;
    password = "kodi";
  };

#  users.extraUsers.kodiUser.password = "dummy";
#  users.mutableUsers = false;

#  boot.plymouth.enable = true;
#  hardware.pulseaudio.enable = true;
#  services.xserver.enable = true;
#  services.xserver.desktopManager.kodi.enable = true;
#  nixpkgs.config.kodi.enableControllers = true;
#  nixpkgs.config.kodi.enableYatp = true;
#  services.xserver.displayManager.lightdm.enable = true;
#  services.xserver.displayManager.lightdm.greeter.enable = false;
  # services.xserver.displayManager.lightdm.autoLogin = {
  #   enable = true;
  #   user = "kodi-user";
  #   timeout = 0;
  # };

  environment.systemPackages = [ pkgs.sway pkgs.kodi-wayland pkgs.retroarch ];
  nixpkgs.config.retroarch = { enableBsnes = true; enableDolphin = true;
    enableMGBA = true; enableMAME = true; };

  systemd.user.services.kodi = {
      enable = true;
      description = "Kodi Media Center.";
      serviceConfig = {
              Type = "simple";
              ExecStart = ''${pkgs.kodi-wayland}/bin/kodi --lircdev /run/lirc/lircd 
                        --standalone & waitPID=$!
              '';
              WorkingDirectory="/home/kodi-user/";
              Restart="always";
              PrivateTmp="true";
              NoNewPrivileges="true";
      };
      #wantedBy = [ "default.target" ];

      bindsTo = [ "graphical-session.target" ];
      wants = [ "graphical-session-pre.target" ];
      after = [ "graphical-session-pre.target" ];
 };
}
