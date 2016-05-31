#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p nix bash
set -eu
export NIX_PATH=nixpkgs=https://github.com/NixOS/nixpkgs-channels/archive/$(cat nix-revision.txt).tar.gz

app=$(basename $PWD)

test -e dist || (mkdir dist && mkdir dist/build && mkdir dist/build/$app)

while true; do
  nix-shell --run "time cabal build $app $@; true"

  # used by ghcjsi repl
  sed -i 's/h$main(h$mainZCZCMainzimain);/module.exports = { h$main: h$main, h$killThread: h$killThread, h$d: h$d, h$baseZCControlziExceptionziBasezinonTermination: h$baseZCControlziExceptionziBasezinonTermination };h$main(h$mainZCZCMainzimain);/g' dist/build/$app/$app.jsexe/all.js

  cp -f dist/build/$app/$app.jsexe/all.js $app/
  nix-shell -p fswatch --run "fswatch -1 -r -i '.*[.]hs$' --event Created --event Updated --event Removed --event Renamed --event MovedFrom --event MovedTo src; true"
done

