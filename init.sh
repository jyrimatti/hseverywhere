#! /usr/bin/env nix-shell
#! nix-shell -i bash -p nix bash cacert
set -eux
source ./nix-shell-init.sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

reactNativeVersion=$(cat files/package.json | grep '"react-native":\s*"[0-9]' | cut -d '"' -f4)
reactNativeMacosVersion=$(cat files/package.json | grep '"react-native-macos":\s*"[0-9]' | cut -d '"' -f4)
reactNativeWindowsVersion=$reactNativeVersion
buildToolsVersion=$(nix-store --query --references $(nix-instantiate '<nixpkgs>' -A androidsdk) | grep 'android-build-tools' | sed 's/.*build-tools-r\(.*\).drv/\1/')

# install react-native-cli and react-native-macos-cli
mkdir rnproject
cp -R files/. rnproject/
nix-shell -p nodejs yarn --run "cd rnproject && yarn add react-native-cli && yarn add react-native-macos-cli"

# init ios/android/macos project
nix-shell -p nodejs yarn python2 --run "\
     (echo yes | node ./rnproject/node_modules/react-native-macos-cli/index.js init rnproject --version=$reactNativeMacosVersion && rm rnproject/.gitignore)\
  && (nix-shell -p yarn --run 'cd rnproject && yarn add react-native-cli && yarn add react-native-macos-cli')\
  && (echo yes | node ./rnproject/node_modules/react-native-cli/index.js init rnproject --version=$reactNativeVersion)\
  && (nix-shell -p yarn --run 'cd rnproject && yarn add react-native-cli && yarn add react-native-macos-cli')"

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

# androidsdk wants to generate license files, so we need to use a mutable copy of the sdk...
nix-shell -p jre8 androidenv.androidsdk_6_0 which --run "cd rnproject/android;\
  nix-store --dump \$(which android | xargs dirname | xargs dirname) > androidsdk.nar;\
  nix-store --restore androidsdk < androidsdk.nar && rm androidsdk.nar"
mkdir "rnproject/android/androidsdk/libexec/licenses" || true
  echo -e "\n8933bad161af4178b1185d1a37fbf41ea5269c55\nd56f5187479451eabf01fb78af6dfcb131a6481e" > "rnproject/android/androidsdk/libexec/licenses/android-sdk-license"
  echo -e "\n84831b9409646a918e30573bab4c9c91346d8abd\nd56f5187479451eabf01fb78af6dfcb131a6481e" > "rnproject/android/androidsdk/libexec/licenses/android-sdk-preview-license"

# copy platforms from behind symplinks since the AVD refers to these locations
for plat in rnproject/android/androidsdk/libexec/platforms/*
do
  mkdir $plat'_'
  cp -R $plat/* $plat'_'/
  rm -R $plat
  mv $plat'_' $plat
  chmod -R u+rw $plat
done

# install all needed npm-stuff
cp -fR files/. rnproject/
nix-shell -p nodejs yarn --run "cd rnproject && yarn install"

# inject .xcconfig to ios build to force xcodebuild use clang as linker
sed -i "s~'-configuration', configuration,~'-configuration', configuration, '-xcconfig', '$DIR/rnproject/.xcconfig',~g" rnproject/node_modules/react-native/local-cli/runIOS/runIOS.js

# I don't know why on earth I need this...
sed -i "s/this.flags = flags;/flags = flags || ''; this.flags = flags;/" rnproject/node_modules/commander/index.js

# android/macos packaging apparently goes through all deps in node_modules, and fails on this synlink
(test ! -L rnproject/node_modules/react-native/third-party/glog-0.3.4/test-driver) || unlink rnproject/node_modules/react-native/third-party/glog-0.3.4/test-driver
(test ! -L rnproject/node_modules/react-native-macos/third-party/glog-0.3.4/test-driver) || unlink rnproject/node_modules/react-native-macos/third-party/glog-0.3.4/test-driver

# node needs more memory:
sed -i "s/^project.ext.react = \[/project.ext.react = \[ nodeExecutableAndArgs: \['node', '--max-old-space-size=4096'],/g" rnproject/android/app/build.gradle 
sed -i "s/export NODE_BINARY=node/export NODE_BINARY='node --max-old-space-size=4096'/g" rnproject/macos/rnproject.xcodeproj/project.pbxproj

# macos hack
sed -i "s/const StatusBarManager = require('NativeModules').StatusBarManager;/const StatusBarManager = require('NativeModules').StatusBarManager;if (!StatusBarManager) StatusBarManager = { 'HEIGHT': -1 };/g" rnproject/node_modules/react-native-macos/Libraries/Components/StatusBar/StatusBar.js

# init Windows project
nix-shell -p nodejs pash --run "cd rnproject && ./node_modules/rnpm/bin/cli windows --windowsVersion $reactNativeWindowsVersion"

# 10.0.2.2 is a VirtualBox alias for localhost
sed -i "s/localhost:8081/10.0.2.2:8081/" rnproject/node_modules/react-native-windows/ReactWindows/ReactNative.Shared/DevSupport/DevServerHelper.cs
# change VS project output path outside of the network share.
sed -r 's/(<OutputPath>)([^<]*)/\1c:\\vagrant-build\\\2/g' rnproject/windows/rnproject/rnproject.csproj > rnproject/windows/rnproject/rnproject.csproj.temp && mv rnproject/windows/rnproject/rnproject.csproj.temp rnproject/windows/rnproject/rnproject.csproj
# enable private network to access react-packager
sed -i 's/<\/Capabilities>/<Capability Name="privateNetworkClientServer"\/><\/Capabilities>/' rnproject/windows/rnproject/Package.appxmanifest

# ignore ghcjs-generated files from transform since it fails in babel for some reason
sed -i "s/function transform(src, filename, options) {/function transform(src, filename, options) { if (filename.indexOf('all.js') > -1) return { code: src };/" rnproject/node_modules/react-native-macos/packager/transformer.js

./init-addons.sh
