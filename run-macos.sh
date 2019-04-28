#! /usr/bin/env nix-shell
#! nix-shell -i bash -p nix bash
set -eu
source ./nix-shell-init.sh

### Note! Note pure, requires xcodebuild! ###

port=${1:-8082}

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

sed -i "s/8081/8082/g" rnproject/node_modules/react-native-macos/React/Base/RCTDefines.h

#nix-shell --pure --run "sed -i \"s/8081/$port/g\" rnproject/node_modules/react-native-macos/React/DevSupport/RCTPackagerConnection.m"
nix-shell --pure --run "sed -i \"s/8081/$port/g\" rnproject/node_modules/react-native-macos/React/Base/RCTBundleURLProvider.m"
nix-shell --pure --run "sed -i \"s/8081/$port/g\" rnproject/node_modules/react-native-macos/React/Modules/RCTRedBox.m"
nix-shell --pure --run "sed -i \"s/8081/$port/g\" rnproject/node_modules/react-native-macos/Libraries/WebSocket/RCTWebSocketExecutor.m"

nix-shell -p nodejs-10_x --run "cd rnproject/macos && PATH=/usr/bin:\$PATH PLATFORM=macos /usr/bin/xcodebuild -xcconfig $DIR/rnproject/.xcconfig -scheme rnproject -configuration Debug -target rnproject build"

x=$( xcodebuild -showBuildSettings -project rnproject/macos/rnproject.xcodeproj | grep ' BUILD_DIR =' | sed -e 's/.*= *//' )
DYLD_FRAMEWORK_PATH=$x/Debug DYLD_LIBRARY_PATH=$x/Debug $x/Debug/rnproject.app/Contents/MacOS/rnproject &
