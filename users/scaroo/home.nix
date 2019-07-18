{ config, pkgs, lib, ... }:
let
  emacsHaskellDev =
  ((import ../../packages/emacs-packages-sets.nix)
  { inherit pkgs; }).emacsHaskellDev;
in {

  imports = [ ../base.nix ];

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [

    #TODO: separate by roles
    nix-prefetch-github
    nix-prefetch-git
    unzip
    wget
    psmisc

    ark
    latte-dock
#    digikam
    spotify
    chromium
    libreoffice
    redshift-plasma-applet
    kdeconnect

    fira-code
    fira-code-symbols
    hack-font
    cabal2nix
    emacsHaskellDev
];


  programs.bash = {
    sessionVariables = {
      NIXOS_DEV_ROOT = "~/code/nix/conf/";
    };
    shellAliases = {
      chromium = "chromium " +
                   builtins.replaceStrings [ "\n" ] [ " " ] ''
                   --load-media-router-component-extension=1
                   --enable-features=ViewsCastDialog
                   --enable-gpu-rasterization
               la    --ignore-gpu-blacklist
                   --enable-native-gpu-memory-buffers
                   --enable-zero-copy
                   --disable-gpu-driver-workarounds
                   '';
     };
  };




  programs.git = {
    enable = true;
    userName  = "scaroo";
    userEmail = "scaroo@gmail.com";
  };

  programs.direnv = {
    enable = true;
  };

  home.file.".direnvrc" = {
    text = ''
use_nix() {
  echo "DEDE"
  local path="$(nix-instantiate --find-file nixpkgs)"

  if [ -f "$path/.version-suffix" ]; then
    local version="$(< $path/.version-suffix)"
  else
    local version="$(< $(< $path/.git/HEAD))"
  fi

  local cache=".direnv/cache-$version-unknown"

  if [[ ! -e "$cache" ]] || \
    [[ "$HOME/.direnvrc" -nt "$cache" ]] || \
    [[ .envrc -nt "$cache" ]] || \
    [[ default.nix -nt "$cache" ]] || \
    [[ shell.nix -nt "$cache" ]];
  then
    [ -d .direnv ] || mkdir .direnv
    local tmp=$(nix-shell --show-trace --pure "$@" \
      --run "\"$direnv\" dump bash")
    echo "$tmp" > "$cache"
  fi

  local path_backup=$PATH term_backup=$TERM
  direnv_load cat "$cache"
  export PATH=$PATH:$path_backup TERM=$term_backup

  if [[ $# = 0 ]]; then
    watch_file default.nix
    watch_file shell.nix
  fi
}
'';

};
}
