#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p nix bash
set -eu
export NIX_PATH=nixpkgs=https://github.com/NixOS/nixpkgs-channels/archive/$(cat nix-revision.txt).tar.gz

port=${1:-8080}

nix-shell --run "GHCJSI_PORT=$port cabal repl"

