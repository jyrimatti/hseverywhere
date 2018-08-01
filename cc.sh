#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p nix bash rsync
set -eu
source ./nix-shell-init.sh

app=$(basename $PWD)

test -e dist || (mkdir dist && mkdir dist/build && mkdir dist/build/$app)

while true; do
  printf '\033\143' #clear
  nix-shell --run "cabal configure --ghcjs && time cabal build $@; true"

  # used by ghcjsi repl
  test -f dist/build/$app/$app.jsexe/all.js && sed -i 's/h$main(h$mainZCZCMainzimain);/module.exports = { h$main: h$main, h$killThread: h$killThread, h$d: h$d, h$baseZCControlziExceptionziBasezinonTermination: h$baseZCControlziExceptionziBasezinonTermination };h$main(h$mainZCZCMainzimain);/g' dist/build/$app/$app.jsexe/all.js

  rsync --checksum dist/build/$app/$app.jsexe/all.js $app/

  nix-shell -p fswatch --run "fswatch -1 -r -i '.*[.]hs$' --event Created --event Updated --event Removed --event Renamed --event MovedFrom --event MovedTo src; true"
done

