#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p nix
set -eu
source ./nix-shell-init.sh

nix-shell -p nodejs --run "rnproject/node_modules/.bin/react-devtools"
