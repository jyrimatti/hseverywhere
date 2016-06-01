#! /usr/bin/env nix-shell
#! nix-shell -i bash -p nix bash
set -eu
export NIX_PATH=nixpkgs=https://github.com/NixOS/nixpkgs-channels/archive/$(cat nix-revision.txt).tar.gz

### Note! Note pure, requires xcodebuild! ###

port=${1:-8083}

app=$(basename $PWD)

cp -f dist/build/$app/$app.jsexe/all.js $app/
cp -fR files/* $app/
mv $app/rn-cli.config.desktop.js $app/rn-cli.config.js

nix-shell --pure --run "sed -i \"s/8081/$port/g\" $app/osx/$app/AppDelegate.m"

nix-shell -p nodejs-5_x xdg_utils --run "cd $app && xdg-open osx/$app.xcodeproj"
nix-shell --pure -p nodejs-5_x --run "cd $app && PORT=$port npm run start-osx"
