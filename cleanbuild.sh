#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p nix bash cacert
set -eu
source ./nix-shell-init.sh

nix-shell --run "cabal clean"
./build.sh
