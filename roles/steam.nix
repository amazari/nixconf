{ config, lib, pkgs, ...}:
{
  users.users.scaroo.packages = [
    pkgs.steam #.override { native=true; }
  ];
  
 hardware.opengl.driSupport32Bit = true;
 hardware.pulseaudio.support32Bit = true;
}
