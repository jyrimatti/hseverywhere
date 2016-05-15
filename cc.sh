#!/bin/sh
set -eu

app=$(basename $PWD)

test -e dist || (mkdir dist && mkdir dist/build && mkdir dist/build/$app)

while true; do
  nix-shell --run "time cabal build $app $@; true"
  cp -f dist/build/$app/$app.jsexe/all.js $app/
  nix-shell -p fswatch --run "fswatch -1 -r -i '.*[.]hs$' --event Created --event Updated --event Removed --event Renamed --event MovedFrom --event MovedTo src; true"
done

