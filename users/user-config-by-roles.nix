{roles}: {

imports = map (s: ./. + "/home-manager-roles/${s}.nix") roles;

}
