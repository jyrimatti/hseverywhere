#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p nix bash
set -eu
source ./nix-shell-init.sh

port=${1:-8081}

androidDevice="Nexus S"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
app=$(basename *.cabal .cabal)

# Apparently qemu requires write permissions to the image... hmm...
nix-shell -p which file --run "chmod u+w rnproject/android/androidsdk/libexec/system-images/android-*/x86_64/system.img"

# print available devices
nix-shell -p jre8 --run "rnproject/android/androidsdk/libexec/tools/android list"

# include /usr/sbin to path to provide system_profiler on osx
nix-shell -p jre8 which file --run "\
     ANDROID_SDK_ROOT=$DIR/rnproject/android/androidsdk/libexec rnproject/android/androidsdk/libexec/tools/android create avd -f -n $app -b default/x86_64 -d \"$androidDevice\" -t \$(rnproject/android/androidsdk/libexec/tools/android list targets -c | sort | head -n1)\
  && PATH=\$PATH:/usr/sbin/ ANDROID_SDK_ROOT=\$DIR/rnproject/android/androidsdk/libexec $DIR/rnproject/android/androidsdk/libexec/tools/emulator -avd $app -no-boot-anim" &

sleep 30
read -t 60  -p "Press enter when emulator is running..." yn || true

nix-shell -p jre8 which nodejs --run "cd rnproject; ADB_INSTALL_TIMEOUT=16 ANDROID_HOME=$DIR/rnproject/android/androidsdk/libexec ./node_modules/.bin/react-native run-android --no-packager"
