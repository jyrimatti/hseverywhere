#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p nix bash
set -eu
source ./nix-shell-init.sh

app=$(basename $PWD)

./cleanbuild.sh

cp -fR files/* $app/
mv $app/rn-cli.config.others.js $app/rn-cli.config.js

# https://github.com/facebook/react-native/issues/5615
nix-shell -p nodejs-5_x --run "cd $app && mkdir -p android/app/build/intermediates/assets/release && node ./node_modules/react-native-cli/index.js bundle --platform android --dev false --entry-file index.android.js --bundle-output android/app/build/intermediates/assets/release/index.android.bundle --assets-dest android/app/src/main/res/"
nix-shell -p jre8 androidsdk which --run "cd $app/android; ANDROID_HOME=\$(which android | xargs dirname | xargs dirname)/libexec/android-sdk-macosx ./gradlew --no-daemon assembleRelease"

cp $app/android/app/build/outputs/apk/app-release.apk dist/$app.apk
echo "Generated dist/$app.apk"
