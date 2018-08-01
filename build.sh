#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p nix bash cacert rsync
set -eu
source ./nix-shell-init.sh

app=$(basename $PWD)

nix-shell --run "cabal configure --ghcjs && cabal build"
rsync --checksum dist/build/$app/$app.jsexe/all.js $app/
