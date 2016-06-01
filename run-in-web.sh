#! /usr/bin/env nix-shell
#! nix-shell -i bash -p nix bash
set -eu
export NIX_PATH=nixpkgs=https://github.com/NixOS/nixpkgs-channels/archive/$(cat nix-revision.txt).tar.gz

port=${1:-8084}

app=$(basename $PWD)

cp -f dist/build/$app/$app.jsexe/all.js $app/
cp -fR files/* $app/
mv $app/rn-cli.config.others.js $app/rn-cli.config.js

nix-shell -p xdg_utils --run "xdg-open http://localhost:$port/"

nix-shell --pure -p nodejs-5_x --run "cd $app && PORT=$port npm run start-web"

