#!/bin/sh
set -eu

app=$(basename $PWD)

ln -fs ../dist/build/$app/$app.jsexe/all.js $app/all.js

cp -fR files/* $app/

nix-shell -p nodejs-5_x --command "cd $app && node ./node_modules/react-native-cli/index.js run-ios" 
nix-shell -p nodejs-5_x --command "cd $app && npm run start"
