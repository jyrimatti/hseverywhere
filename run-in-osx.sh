#!/bin/sh
set -eu

port=${1:-8083}

app=$(basename $PWD)

cp -f dist/build/$app/$app.jsexe/all.js $app/
cp -fR files/* $app/
mv $app/rn-cli.config.desktop.js $app/rn-cli.config.js

sed -i '' "s/8081/$port/g" $app/osx/$app/AppDelegate.m

nix-shell -p nodejs-5_x --run "cd $app && open osx/$app.xcodeproj"
nix-shell -p nodejs-5_x --run "cd $app && PORT=$port npm run start-osx"
