#!/bin/sh

port=${1:-8080}

nix-shell --run "GHCJSI_PORT=$port cabal repl"

