{ config, lib, pkgs, ... }:
{
  imports = [ ./intel-common.nix ];
 boot.kernelPackages = pkgs.linuxPackages_5_0;
}
