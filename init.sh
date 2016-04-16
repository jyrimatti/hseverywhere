#!/bin/sh
set -eux

app=$(basename $PWD)

# install react-native-cli and react-native-desktop-cli
mkdir $app
cp files/package.json $app/
cp files/npm-shrinkwrap.json $app/
nix-shell -p nodejs-5_x --command "cd $app && npm install react-native-cli && npm install react-native-desktop-cli"

# init ios/android/osx project
nix-shell -p nodejs-5_x --command "(echo yes | node ./$app/node_modules/react-native-cli/index.js init $app) && (node ./$app/node_modules/react-native-desktop-cli/index.js init $app) && cd $app && node_modules/react-native-cli/index.js android"


# install all needed npm-stuff
cp -fR files/* $app/
nix-shell -p nodejs-5_x --command "cd $app && npm install"


# ignore ghcjs-generated files from transform since it's too slow
sed -i '' "s/function transform(src, filename, options) {/function transform(src, filename, options) { if (filename.indexOf('all.js') > -1) return { code: src };/" $app/node_modules/react-native/packager/transformer.js
sed -i '' "s/function transform(src, filename, options) {/function transform(src, filename, options) { if (filename.indexOf('all.js') > -1) return { code: src };/" $app/node_modules/react-native-desktop/packager/transformer.js
