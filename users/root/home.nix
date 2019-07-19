{ config, pkgs, ... }:
let
  userConfigByRoles = import ../user-config-by-roles.nix;

in userConfigByRoles {roles = ["troubleshoot.nix"];}
