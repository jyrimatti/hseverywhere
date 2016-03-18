#!/bin/sh

test -e hsEverywhere || (
  nix-shell -p nodePackages.react-native-cli --command "react-native init hsEverywhere" &&
  echo "'use strict';" > hsEverywhere/index.ios.js &&
  echo "require('./require_app');" >> hsEverywhere/index.ios.js
)

# symlink the app
ln -fs ../dist/build/hsEverywhere-ios/hsEverywhere-ios.jsexe/all.js hsEverywhere/all.js

# copy necessary file next to main js-files, since apparently cannot require from parent dir...?
cp -f require_app.js hsEverywhere/

# for some reason goog.crypt.Hash needs to be faked
cp -f package.json hsEverywhere/
cp -fR goog.crypt.Hash hsEverywhere/

# needed to pull goog.crypt.Hash to node_modules
nix-shell -p nodejs --command "cd hsEverywhere && npm install --save"

nix-shell -p nodePackages.react-native-cli --command "cd hsEverywhere && react-native run-ios"

# add the following line to
#  ./hsEverywhere/node_modules/react-native/packager/transformer.js
# to make startup quicker.
#  if (filename.indexOf('all.js') > -1) {return { code: src };};
