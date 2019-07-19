{ ... }:
let
  userConfigByRoles = import ../user-config-by-roles.nix;
in {
imports = [ ../scaroo-base
            <home-manager/nixos> ];

  home-manager.users.scaroo = { pkgs, config, lib, options }:
   userConfigByRoles {
     roles = [ "base" "kde-tools" "desktop" "haskell-dev" ];
  };
}
