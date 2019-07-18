{ stdenv, lib, fetchFromGitHub,
ncurses,
portmidiSupport ? false, portmidi ? null
}:
assert portmidiSupport -> portmidi != null;


stdenv.mkDerivation {
  name = "orca-c";
  builder = ./builder.sh;

  src = fetchFromGitHub {
    owner = "hundredrabbits";
    repo = "Orca-c";
    rev =  "bc56c51c61e71212eaa99f39aae9c481a1d3311b";
    sha256 =  "0n5s7difffzchqb74zxpnvbdg3k1wf98kg5ljlgl3yzsqj736412";
    fetchSubmodules = false;
  };

  portmidiSupport = portmidiSupport;
  buildInputs = [ ncurses ] ++ lib.optional portmidiSupport portmidi;

  meta = with lib; {
   description = "Orca is a visual programming playground. C port.";
   longDescription = "Orca is an esoteric programming language, designed to create procedural sequencers.";
   homepage = "https://wiki.xxiivv.com/#orca";
   license = licenses.mit;
   maintainers = [{name = "Alexandre Mazari"; email = "alexandre.mazari@gmail.com";}];
   platforms = platforms.all;

  };
}
