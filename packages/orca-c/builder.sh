source $stdenv/setup

# build with portmidi support?
portmidiOption=$([ "$portmidiSupport" == 1 ] && echo "--portmidi" || echo "")

mkdir workingdir
cp -r $src/* workingdir/
cd workingdir
sh tool $portmidiOption build release orca

mkdir -p $out/bin
mv build/release/orca $out/bin/orca-c
