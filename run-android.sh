#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p nix bash
set -eu
source ./nix-shell-init.sh

port=${1:-8081}

androidDevice="Nexus S"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
app=$(basename *.cabal .cabal)

version=$(nix-store --query --references $(nix-instantiate '<nixpkgs>' -A androidsdk_9_0) | grep 'build-tools' | sed 's/.*build-tools-\([^.]*\).*.drv/\1/')

echo "Make sure you don't have another emulator (VirtualBox, Docker...) running."

# print available devices
nix-shell -p jre8 --run "rnproject/android/androidsdk/bin/android list"

nix-shell -p "androidenv.emulateApp { platformVersion = \"$version\"; abiVersion = \"x86_64\"; name = \"$app\"; }" --run "run-test-emulator"

nix-shell -p jre8 which nodejs-10_x androidsdk_9_0 --run "cd rnproject; ADB_INSTALL_TIMEOUT=16 ANDROID_HOME=$DIR/rnproject/android/androidsdk/libexec PATH=$DIR/rnproject/android/androidsdk/libexec/platform-tools/:\$PATH ./node_modules/.bin/react-native run-android --no-packager"
