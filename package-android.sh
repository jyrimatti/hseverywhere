#!/bin/sh
set -eu

app=$(basename $PWD)

nix-shell --run "cabal clean && cabal build $app"

cp -f dist/build/$app/$app.jsexe/all.js $app/
cp -fR files/* $app/
mv $app/rn-cli.config.others.js $app/rn-cli.config.js

# https://github.com/facebook/react-native/issues/5615
nix-shell -p nodejs-5_x --run "cd $app && mkdir -p android/app/build/intermediates/assets/release && node ./node_modules/react-native-cli/index.js bundle --platform android --dev false --entry-file index.android.js --bundle-output android/app/build/intermediates/assets/release/index.android.bundle --assets-dest android/app/src/main/res/"
sh -c "cd $app/android; ./gradlew assembleRelease"

cp $app/android/app/build/outputs/apk/app-release.apk dist/$app.apk
echo "Generated dist/$app.apk"
