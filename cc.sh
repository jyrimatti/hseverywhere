#!/bin/sh
set -eu

app=$(basename $PWD)

test -e dist || (mkdir dist && mkdir dist/build && mkdir dist/build/$app)

while true; do
  nix-shell --command "time cabal build $app $@"
  cp -f dist/build/$app/$app.jsexe/all.js $app/
  nix-shell -p fswatch --command "fswatch -1 -r src || true"
done

