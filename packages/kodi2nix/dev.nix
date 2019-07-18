{ base, stdenv, xml2json }:
stdenv.mkDerivation {
  pname = "kodi2nix";
  version = "0.1.0";
  src = ../kodi2nix;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base xml2json ];
 # license = stdenv.lib.licenses.bsd3;
}
