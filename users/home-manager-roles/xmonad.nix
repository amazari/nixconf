{ config, pkgs, ... }: {

  services.taffybar.enable = true;
  xsession.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    config = ''

   import XMonad

   main = xmonad $ def
       { borderWidth        = 2
       , modMask = mod4Mask
       , terminal           = "alacrity"
       , normalBorderColor  = "#cccccc"
       , focusedBorderColor = "#cd8b00" }


'';
  };
}
