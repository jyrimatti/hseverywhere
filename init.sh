#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p nix bash
set -eux
export NIX_PATH=nixpkgs=https://github.com/NixOS/nixpkgs-channels/archive/$(cat nix-revision.txt).tar.gz

app=$(basename $PWD)

androidDevice="7in WSVGA (Tablet)"

reactNativeVersion=$(cat files/package.json | grep '"react-native"' | cut -d '"' -f4)
reactNativeDesktopVersion=$(cat files/package.json | grep '"react-native-desktop"' | cut -d '"' -f4)

# install react-native-cli and react-native-desktop-cli
mkdir $app
cp files/package.json $app/
test -f files/npm-shrinkwrap && cp files/npm-shrinkwrap.json $app/
nix-shell -p nodejs-5_x --run "cd $app && npm install react-native-cli && npm install react-native-desktop-cli"

# add correct react-native-desktop version for the cli-tool to install.
sed -i "s/npm install --save react-native-desktop/npm install --save react-native-desktop@$reactNativeDesktopVersion/g" $app/node_modules/react-native-desktop-cli/index.js

# init ios/android/osx project
nix-shell -p nodejs-5_x python2 --run "\
     (echo yes | node ./$app/node_modules/react-native-cli/index.js init $app --version=$reactNativeVersion)\
  && (echo yes | node ./$app/node_modules/react-native-desktop-cli/index.js init $app --version=$reactNativeDesktopVersion)\
  && (cd $app && node ./node_modules/react-native-cli/index.js android)"

# Android package signing
echo "MYAPP_RELEASE_STORE_FILE=my-release-key.keystore" >> $app/android/gradle.properties
echo "MYAPP_RELEASE_KEY_ALIAS=my-key-alias" >> $app/android/gradle.properties
echo "MYAPP_RELEASE_STORE_PASSWORD=foobar" >> $app/android/gradle.properties
echo "MYAPP_RELEASE_KEY_PASSWORD=foobar" >> $app/android/gradle.properties
sed -i "s/defaultConfig {/signingConfigs {release {storeFile file(MYAPP_RELEASE_STORE_FILE); storePassword MYAPP_RELEASE_STORE_PASSWORD;keyAlias MYAPP_RELEASE_KEY_ALIAS;keyPassword MYAPP_RELEASE_KEY_PASSWORD}}; buildTypes { release { signingConfig signingConfigs.release }}; defaultConfig {/g" $app/android/app/build.gradle
sed -i "s/minifyEnabled/signingConfig signingConfigs.release; minifyEnabled/g" $app/android/app/build.gradle

# create Android virtual machine
nix-shell -p jre8 androidsdk --run "android create avd -f -n $app -b default/x86_64 -d \"$androidDevice\" -t \$(android list targets -c | tail -n 1)"

# install all needed npm-stuff
cp -fR files/* $app/
nix-shell -p nodejs-5_x --run "cd $app && npm install"


# ignore ghcjs-generated files from transform since it's too slow
sed -i "s/function transform(src, filename, options) {/function transform(src, filename, options) { if (filename.indexOf('all.js') > -1) return { code: src };/" $app/node_modules/react-native/packager/transformer.js
sed -i "s/function transform(src, filename, options) {/function transform(src, filename, options) { if (filename.indexOf('all.js') > -1) return { code: src };/" $app/node_modules/react-native-desktop/packager/transformer.js

