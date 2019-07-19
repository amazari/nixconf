{ config, pkgs, lib, ... }:{
  home.packages =  with pkgs;[
    ark
    kdeconnect
  ];

}
