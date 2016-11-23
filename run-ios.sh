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

nix-shell -p nodejs --run "cd $app && ./node_modules/.bin/react-native run-ios"
