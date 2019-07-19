{ config, pkgs, lib, ... }: {

  home.packages = with pkgs;[
    chromium
    spotify
  ];

  programs.bash.shellAliases = {
      chromium = "chromium " +
                   builtins.replaceStrings [ "\n" ] [ " " ] ''
                   --load-media-router-component-extension=1
                   --enable-features=ViewsCastDialog
                   --enable-gpu-rasterization
                   --ignore-gpu-blacklist
                   --enable-native-gpu-memory-buffers
                   --enable-zero-copy
                   --disable-gpu-driver-workarounds
                   '';
  };
}
