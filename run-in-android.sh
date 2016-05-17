#!/bin/sh
set -eu

androidSdkLocation=${1:-$(echo ~)/Library/Android/sdk/}

port=${2:-8081}

app=$(basename $PWD)

cp -f dist/build/$app/$app.jsexe/all.js $app/
cp -fR files/* $app/
mv $app/rn-cli.config.others.js $app/rn-cli.config.js

$androidSdkLocation/tools/emulator -avd $app -ranchu -no-skin -no-boot-anim &
sleep 1
read -p "Press enter when emulator is running..." yn
nix-shell -p nodejs-5_x --run "cd $app && node ./node_modules/react-native-cli/index.js run-android"
nix-shell -p nodejs-5_x --run "cd $app && PORT=$port npm run start"
