#! /usr/bin/env nix-shell
#! nix-shell -i bash -p nix bash
set -eu
source ./nix-shell-init.sh

### Note! Note pure, requires xcodebuild! ###

port=${1:-8082}

app=$(basename $PWD)

./build.sh

cp -fR files/* $app/

nix-shell --pure --run "sed -i \"s/8081/$port/g\" $app/node_modules/react-native-macos/React/DevSupport/RCTPackagerConnection.m"
nix-shell --pure --run "sed -i \"s/8081/$port/g\" $app/node_modules/react-native-macos/React/Base/RCTBundleURLProvider.m"
nix-shell --pure --run "sed -i \"s/8081/$port/g\" $app/node_modules/react-native-macos/React/Modules/RCTRedBox.m"
nix-shell --pure --run "sed -i \"s/8081/$port/g\" $app/node_modules/react-native-macos/Libraries/WebSocket/RCTWebSocketExecutor.m"

dir=$PWD
nix-shell -p nodejs --run "cd $app/macos && PLATFORM=macos /usr/bin/xcodebuild -xcconfig $dir/$app/.xcconfig -scheme $app -configuration Debug -target $app build"

x=$( xcodebuild -showBuildSettings -project $app/macos/hseverywhere.xcodeproj | grep ' BUILD_DIR =' | sed -e 's/.*= *//' )
DYLD_FRAMEWORK_PATH=$x/Debug DYLD_LIBRARY_PATH=$x/Debug $x/Debug/hseverywhere.app/Contents/MacOS/hseverywhere
