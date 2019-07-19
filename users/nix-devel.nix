{ config, pkgs, lib, ... }: {

  programs.bash.sessionVariables = {
      NIXOS_DEV_ROOT = "~/code/nix/conf/";
  };

  programs.git = {
    enable = true;
    userName  = "scaroo";
    userEmail = "scaroo@gmail.com";
  };

  home.packages = with pkgs; [
    nix-prefetch-github
    nix-prefetch-git

    fira-code
    fira-code-symbols
    hack-font
  ];

  programs.direnv = {
    enable = true;
  };

  home.file.".direnvrc" = {
    text = ''
use_nix() {
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
