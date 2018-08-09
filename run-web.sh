#! /usr/bin/env nix-shell
#! nix-shell -i bash -p nix bash
set -eu
source ./nix-shell-init.sh

port=${1:-8083}

nix-shell -p xdg_utils --run "xdg-open http://localhost:$port/"

