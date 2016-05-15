#!/bin/sh
set -eu

app=$(basename $PWD)

nix-shell --run "cabal clean && cabal build $app"
cp -f dist/build/$app/$app.jsexe/all.js $app/

cp -f dist/build/$app/$app.jsexe/all.js $app/
cp -fR files/* $app/
mv $app/rn-cli.config.others.js $app/rn-cli.config.js

sh -c "cd $app/android; ./gradlew assembleRelease"

cp $app/android/app/build/outputs/apk/app-release-unsigned.apk dist/$app.apk
echo "Generated dist/$app.apk"
