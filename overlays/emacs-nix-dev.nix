self: super: {
 emacs-nix-admin = (super.emacsPackagesNgGen super.emacs26-nox).emacsWithPackages (epkgs:
     (with epkgs.melpaPackages; [
#      org-mode
      nix-mode
      magit
     ])
   );

emacs-haskell = self.emacsWithPackages [];
#WithPackages (epkgs:
#    (with epkgs.melpaPackages; [
#      haskell-mode
#      flycheck
#      dante
#  ])
#[]
#  );

}
