#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p nix
set -eu
source ./nix-shell-init.sh

app=$(basename $PWD)

nix-shell -p nodejs --run "$app/node_modules/.bin/react-devtools"
