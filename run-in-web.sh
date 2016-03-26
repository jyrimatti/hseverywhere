#!/bin/sh

app=$(basename $PWD)

test -e $app || (
  nix-shell -p nodePackages_5_x.react-native-cli --command "react-native init $app && cd $app && react-native android npm install --save && npm install react-dom react"
)

# symlink the app
ln -fs ../dist/build/$app/$app.jsexe/all.js $app/all.js

# copy necessary file next to main js-files, since apparently cannot require from parent dir...?
cp -fR files/* $app/

open http://localhost:8080/

# needed to pull goog.crypt.Hash to node_modules
nix-shell -p nodejs-5_x --command "cd $app && npm run dev"

