#!/bin/sh

app=$(basename $PWD)

test -e $app || (
  nix-shell -p nodePackages_5_x.react-native-cli --command "react-native init $app && cd $app && react-native android npm install --save && npm install react-dom react"
)

# symlink the app
ln -fs ../dist/build/$app/$app.jsexe/all.js $app/all.js

# copy necessary file next to main js-files, since apparently cannot require from parent dir...?
cp -fR files/* $app/

nix-shell -p nodePackages_5_x.react-native-cli --command "cd $app && react-native run-android"

# add the following line to
#  ./$app/node_modules/react-native/packager/transformer.js
# to make startup quicker.
#  if (filename.indexOf('all.js') > -1) {return { code: src };};
