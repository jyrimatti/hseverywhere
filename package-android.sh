#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p nix bash cacert
set -eu
source ./nix-shell-init.sh

app=$(basename $PWD)

./build.sh

cp -fR files/* $app/

# https://github.com/facebook/react-native/issues/5615
nix-shell -p nodejs --run "cd $app && mkdir -p android/app/build/intermediates/assets/release && PLATFORM=android ./node_modules/.bin/react-native bundle --platform android --dev false --entry-file index.js --bundle-output android/app/build/intermediates/assets/release/index.android.bundle --assets-dest android/app/src/main/res/"

nix-shell -p nodejs jre8 --run "cd $app/android; ANDROID_HOME=$(pwd)/$app/android/androidsdk/libexec ./gradlew --no-daemon assembleRelease"

test -d release || mkdir release
test -f release/$app.apk && rm release/$app.apk
cp $app/android/app/build/outputs/apk/app-release.apk release/$app.apk
echo "Generated release/$app.apk"
