#! /usr/bin/env nix-shell
#! nix-shell -i bash -p nix bash cacert
set -eux
source ./nix-shell-init.sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

reactNativeVersion=$(cat files/package.json | grep '"react-native":\s*"[0-9]' | cut -d '"' -f4)
reactNativeMacosVersion=$(cat files/package.json | grep '"react-native-macos":\s*"[0-9]' | cut -d '"' -f4)
buildToolsVersion=$(nix-store --query --references $(nix-instantiate '<nixpkgs>' -A androidsdk_9_0) | grep 'build-tools' | sed 's/.*build-tools-\([^.]*\).*.drv/\1/')

# install react-native-cli and react-native-macos-cli
mkdir rnproject
cp -R files/. rnproject/

# init ios/android/macos project
nix-shell -p nodejs-10_x yarn --run "cd rnproject && yarn add react-native-macos-cli"
nix-shell -p nodejs-10_x yarn python2 --run "echo yes | node ./rnproject/node_modules/react-native-macos-cli/index.js init rnproject --version=$reactNativeMacosVersion && rm rnproject/.gitignore"
nix-shell -p nodejs-10_x yarn python2 --run "cd rnproject && yarn add react-native-cli"
nix-shell -p nodejs-10_x yarn python2 --run "echo yes | node ./rnproject/node_modules/react-native-cli/index.js init rnproject --version=$reactNativeVersion"

mkdir rnproject/ios/build
mkdir rnproject/ios/build/Index
mkdir rnproject/ios/build/Index/DataStore

# Android package signing
echo "MYAPP_RELEASE_STORE_FILE=my-release-key.keystore" >> rnproject/android/gradle.properties
echo "MYAPP_RELEASE_KEY_ALIAS=my-key-alias" >> rnproject/android/gradle.properties
echo "MYAPP_RELEASE_STORE_PASSWORD=foobar" >> rnproject/android/gradle.properties
echo "MYAPP_RELEASE_KEY_PASSWORD=foobar" >> rnproject/android/gradle.properties
sed -i "s/defaultConfig {/signingConfigs {release {storeFile file(MYAPP_RELEASE_STORE_FILE); storePassword MYAPP_RELEASE_STORE_PASSWORD;keyAlias MYAPP_RELEASE_KEY_ALIAS;keyPassword MYAPP_RELEASE_KEY_PASSWORD}}; buildTypes { release { signingConfig signingConfigs.release }}; defaultConfig {/g" rnproject/android/app/build.gradle
sed -i "s/minifyEnabled/signingConfig signingConfigs.release; minifyEnabled/g" rnproject/android/app/build.gradle

sed -i "s/^android [{]/android { adbOptions.timeOutInMs = 8*60*1000; com.android.ddmlib.DdmPreferences.setTimeOut(8*60*1000)/" rnproject/android/app/build.gradle

# change project buildTools to that available from nixpkgs
sed -i "s/buildToolsVersion \"[^\"]*\"/buildToolsVersion \"$buildToolsVersion\"/" rnproject/android/app/build.gradle

# update minsdkversion if too old
sed -i "s/minSdkVersion = 16/minSdkVersion = 17/g" rnproject/android/build.gradle

# androidsdk wants license files, so we need to use a mutable copy of the sdk...
rm -R rnproject/android/androidsdk
nix-shell -p jre8 "(androidenv.composeAndroidPackages { platformVersions = [\"$buildToolsVersion\"]; abiVersions = [\"x86\" \"x86_64\"]; includeNDK = true; }).androidsdk" which --run "cd rnproject/android;\
  nix-store --dump \$(which android | xargs dirname | xargs dirname) > androidsdk.nar;\
  nix-store --restore androidsdk < androidsdk.nar && rm androidsdk.nar"

# copy platforms from behind symplinks since the AVD refers to these locations
for plat in rnproject/android/androidsdk/libexec/android-sdk/platforms/*
do
  mkdir $plat'_'
  cp -R $plat/* $plat'_'/
  rm -R $plat
  mv $plat'_' $plat
  chmod -R u+rw $plat
done

# node needs more memory:
sed -i "s/^project.ext.react = \[/project.ext.react = \[ nodeExecutableAndArgs: \['node', '--max-old-space-size=4096'],/g" rnproject/android/app/build.gradle 
sed -i "s/export NODE_BINARY=node/export NODE_BINARY='node --max-old-space-size=4096'/g" rnproject/macos/rnproject.xcodeproj/project.pbxproj

cp -fR files/. rnproject/
nix-shell -p nodejs-10_x yarn --run "cd rnproject && yarn install"

# macos hack
sed -i "s/const StatusBarManager = require('NativeModules').StatusBarManager;/const StatusBarManager = require('NativeModules').StatusBarManager;if (!StatusBarManager) StatusBarManager = { 'HEIGHT': -1 };/g" rnproject/node_modules/react-native-macos/Libraries/Components/StatusBar/StatusBar.js

# init Windows project
# I don't know why on earth I need the sed...
nix-shell -p nodejs-10_x yarn python2 pash --run "cd rnproject && yarn add rnpm-plugin-windows --dev && sed -i \"s/this.flags = flags;/flags = flags || ''; this.flags = flags;/\" ./node_modules/commander/index.js && ./node_modules/.bin/rnpm windows"

# 10.0.2.2 is a VirtualBox alias for localhost
sed -i "s/localhost:8081/10.0.2.2:8081/" rnproject/node_modules/react-native-windows/ReactWindows/ReactNative.Shared/DevSupport/DevServerHelper.cs
# change VS project output path outside of the network share.
sed -r 's/(<OutputPath>)([^<]*)/\1c:\\vagrant-build\\\2/g' rnproject/windows/rnproject/rnproject.csproj > rnproject/windows/rnproject/rnproject.csproj.temp && mv rnproject/windows/rnproject/rnproject.csproj.temp rnproject/windows/rnproject/rnproject.csproj
# enable private network to access react-packager
sed -i 's/<\/Capabilities>/<Capability Name="privateNetworkClientServer"\/><\/Capabilities>/' rnproject/windows/rnproject/Package.appxmanifest

# ignore ghcjs-generated files from transform since it fails in babel for some reason
#sed -i "s/function transform(src, filename, options) {/function transform(src, filename, options) { if (filename.indexOf('all.js') > -1) return { code: src };/" rnproject/node_modules/react-native-macos/packager/transformer.js

sed -i "s/if (!sha1) {/if (!sha1) { return require('crypto').createHash('sha1').update(fs.readFileSync(resolvedPath)).digest('hex');/" rnproject/node_modules/react-native/node_modules/metro/src/node-haste/DependencyGraph.js

# otherwise Android emulator fails with "Strict mode does not allow function declarations in a lexically nested statement"
find ./rnproject/node_modules/react-native/ -type f -exec sed -i 's/use strict//g' {} \;

# fix finding ios simulators
sed -i "s/version\.startsWith/version.includes/g" rnproject/node_modules/react-native/local-cli/runIOS/findMatchingSimulator.js

./init-addons.sh
