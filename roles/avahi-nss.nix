{ config, pkgs, ... }:
{
  services.avahi = {
    enable = true;
    publish.enable = true;
    ipv4 = true;
    ipv6 = false;

    # resolve .local names
    nssmdns = true;

    publish.workstation = true;
    publish.userServices = true;
  };
}
