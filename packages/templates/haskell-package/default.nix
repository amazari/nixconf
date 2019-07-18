{ mkDerivation, async, async-timer, base, brick, broadcast-chan
, containers, criterion-measurement, microlens, microlens-th
, reactive-banana, stdenv, text, text-zipper, vty, haskell
}:
mkDerivation {
  pname = "horca";
  version = "0.1.0";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
  async (haskell.lib.dontCheck async-timer) base brick broadcast-chan containers
    criterion-measurement microlens microlens-th reactive-banana text
    text-zipper vty
  ];
  executableHaskellDepends = [
    async (haskell.lib.dontCheck async-timer) base brick criterion-measurement microlens
    microlens-th reactive-banana text text-zipper vty
  ];
  license = stdenv.lib.licenses.bsd3;
}
