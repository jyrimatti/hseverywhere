#! /usr/bin/env nix-shell
#! nix-shell -i bash -p nix bash
set -eu
source ./nix-shell-init.sh

### Note! Note pure, requires xcode! ###

port=${1:-8081}

app=$(basename $PWD)

./build.sh

cp -fR files/* $app/

nix-shell --pure --run "sed -i \"s/8081/$port/g\" $app/ios/$app/AppDelegate.m"

nix-shell -p nodejs-5_x --run "cd $app && node ./node_modules/react-native-cli/index.js run-ios"
