self: super: {
  let
    commandLineArgs = callPackage ../packages/chromium-accelerated.nix
  in self.chromium.override { inherits commandLineArgs }
}
