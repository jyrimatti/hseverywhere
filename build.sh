#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p nix bash
set -eu
source ./nix-shell-init.sh

app=$(basename $PWD)

echo 'compiler: ghcjs' > cabal.config

nix-shell --run "cabal build $app; rm cabal.config"
cp -f dist/build/$app/$app.jsexe/all.js $app/

test -f cabal.config && rm cabal.config || true
