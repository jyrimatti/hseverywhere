#! /usr/bin/env nix-shell
#! nix-shell -i bash -p nix bash
set -eu
source ./nix-shell-init.sh

### Note! Note pure, requires xcodebuild! ###

port=${1:-8082}

app=$(basename $PWD)

./build.sh

cp -fR files/* $app/

nix-shell --pure --run "sed -i \"s/8081/$port/g\" $app/osx/$app/AppDelegate.m"

nix-shell -p nodejs-5_x xdg_utils --run "cd $app && xdg-open osx/$app.xcodeproj"
