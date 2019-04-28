#! /usr/bin/env nix-shell
#! nix-shell -i bash -p nix bash

set -eu
source ./nix-shell-init.sh

#nix-shell --argstr compiler default "$@"
nix-shell "$@"
