{ username, config, lib, pkgs, ...}:
{
    users.users.$(username).packages = with pkgs: [
    steam #.override { native=true; }
  ];
  
 hardware.opengl.driSupport32Bit = true;
 hardware.pulseaudio.support32Bit = true;
}
