{builtins}:
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
