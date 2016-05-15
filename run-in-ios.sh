#!/bin/sh
set -eu

port=${1:-8082}

app=$(basename $PWD)

cp -f dist/build/$app/$app.jsexe/all.js $app/
cp -fR files/* $app/
mv $app/rn-cli.config.others.js $app/rn-cli.config.js

sed -i '' "s/8081/$port/g" $app/ios/$app/AppDelegate.m

nix-shell -p nodejs-5_x --run "cd $app && node ./node_modules/react-native-cli/index.js run-ios" &
nix-shell -p nodejs-5_x --run "cd $app && PORT=$port npm run start --loglevel verbose"
