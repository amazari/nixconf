self: super: {
emacs = (super.emacsPackagesNgGen super.emacs).emacsWithPackages (epkgs:
    (with epkgs.melpaPackages; [
      nix-mode
    ])
  );
}
