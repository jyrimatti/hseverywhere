#!/bin/sh
set -eux

androidSdkLocation=${1:-$(echo ~)/Library/Android/sdk/}

app=$(basename $PWD)

androidDevice="7in WSVGA (Tablet)"

# install react-native-cli and react-native-desktop-cli
mkdir $app
cp files/package.json $app/
test -f files/npm-shrinkwrap && cp files/npm-shrinkwrap.json $app/
nix-shell -p nodejs-5_x --run "cd $app && npm install react-native-cli && npm install react-native-desktop-cli"

# init ios/android/osx project
nix-shell -p nodejs-5_x --run "(echo yes | node ./$app/node_modules/react-native-cli/index.js init $app) && (node ./$app/node_modules/react-native-desktop-cli/index.js init $app) && cd $app && node_modules/react-native-cli/index.js android"

# Android package signing
echo "MYAPP_RELEASE_STORE_FILE=my-release-key.keystore" >> $app/android/gradle.properties
echo "MYAPP_RELEASE_KEY_ALIAS=my-key-alias" >> $app/android/gradle.properties
echo "MYAPP_RELEASE_STORE_PASSWORD=foobar" >> $app/android/gradle.properties
echo "MYAPP_RELEASE_KEY_PASSWORD=foobar" >> $app/android/gradle.properties
sed -i '' "s/defaultConfig {/signingConfigs {release {storeFile file(MYAPP_RELEASE_STORE_FILE); storePassword MYAPP_RELEASE_STORE_PASSWORD;keyAlias MYAPP_RELEASE_KEY_ALIAS;keyPassword MYAPP_RELEASE_KEY_PASSWORD}}; buildTypes { release { signingConfig signingConfigs.release }}; defaultConfig {/g" $app/android/app/build.gradle
sed -i '' "s/minifyEnabled/signingConfig signingConfigs.release; minifyEnabled/g" $app/android/app/build.gradle

# Android SDK location
echo "sdk.dir=$androidSdkLocation" > $app/android/local.properties

# create Android virtual machine
$androidSdkLocation/tools/android create avd -f -n $app -g google_apis -d "$androidDevice" -t $($androidSdkLocation/tools/android list targets -c | tail -n 1)

# install all needed npm-stuff
cp -fR files/* $app/
nix-shell -p nodejs-5_x --run "cd $app && npm install"


# ignore ghcjs-generated files from transform since it's too slow
sed -i '' "s/function transform(src, filename, options) {/function transform(src, filename, options) { if (filename.indexOf('all.js') > -1) return { code: src };/" $app/node_modules/react-native/packager/transformer.js
sed -i '' "s/function transform(src, filename, options) {/function transform(src, filename, options) { if (filename.indexOf('all.js') > -1) return { code: src };/" $app/node_modules/react-native-desktop/packager/transformer.js

