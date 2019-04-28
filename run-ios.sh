#! /usr/bin/env nix-shell
#! nix-shell -i bash -p nix bash
set -eu
source ./nix-shell-init.sh

### Note! Note pure, requires xcode! ###

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

port=${1:-8081}

nix-shell --pure --run "sed -i \"s/8081/$port/g\" rnproject/ios/rnproject/AppDelegate.m"

# inject .xcconfig to ios build to force xcodebuild use clang as linker
sed -i "s~var xcodebuildArgs = \[~var xcodebuildArgs =  \['-xcconfig', '$DIR/rnproject/.xcconfig',~g" rnproject/node_modules/react-native/local-cli/runIOS/runIOS.js

nix-shell -p nodejs-10_x --run "(cd rnproject && PATH=/usr/bin:\$PATH ./node_modules/.bin/react-native run-ios --no-packager)"
