#!/bin/sh
set -eu

app=$(basename $PWD)

cp -f dist/build/$app/$app.jsexe/all.js $app/
cp -fR files/* $app/
mv $app/rn-cli.config.desktop.js $app/rn-cli.config.js

nix-shell -p nodejs-5_x --command "cd $app && open osx/$app.xcodeproj"
nix-shell -p nodejs-5_x --command "cd $app && npm run start-desktop"
