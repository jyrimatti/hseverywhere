#!/bin/sh
set -eu

app=$(basename $PWD)

cp -f dist/build/$app/$app.jsexe/all.js $app/
cp -fR files/* $app/

nix-shell -p nodejs-5_x --command "cd $app && node ./node_modules/react-native-cli/index.js run-android"
nix-shell -p nodejs-5_x --command "cd $app && npm run start"
