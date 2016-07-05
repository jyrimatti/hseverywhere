#! /usr/bin/env nix-shell
#! nix-shell -i bash -p nix bash
set -eu
source ./nix-shell-init.sh

### Note! Note pure, requires xcodebuild! ###

port=${1:-8083}

app=$(basename $PWD)

./build.sh

cp -fR files/* $app/
mv $app/rn-cli.config.desktop.js $app/rn-cli.config.js

nix-shell --pure --run "sed -i \"s/8081/$port/g\" $app/osx/$app/AppDelegate.m"

nix-shell -p nodejs-5_x xdg_utils --run "cd $app && xdg-open osx/$app.xcodeproj"
nix-shell --pure -p nodejs-5_x --run "cd $app && PORT=$port npm run start-osx"
