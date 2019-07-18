{ mkDerivation, aeson, base, conduit, http-conduit, stdenv
, xml-conduit, xml2json
}:
mkDerivation {
  pname = "kodi2nix";
  version = "0.1.0";
  src = ../kodi2nix;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    aeson base conduit http-conduit xml-conduit xml2json
  ];
  license = stdenv.lib.licenses.bsd3;
}
