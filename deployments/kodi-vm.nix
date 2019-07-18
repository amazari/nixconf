{ config, pkgs, ... }:
{
  imports = [ <nixpkgs/nixos/modules/virtualisation/qemu-vm.nix>
    ../roles/kodi.nix ];





}
