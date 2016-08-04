#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p nix bash
set -eu
source ./nix-shell-init.sh

port=${1:-8081}

androidDevice="7in WSVGA (Tablet)"

app=$(basename $PWD)

./build.sh

cp -fR files/* $app/

# include /usr/sbin to path to provide system_profiler on osx
nix-shell -p androidsdk jre8 which file --run "\
     android create avd -f -n $app -b default/x86_64 -d \"$androidDevice\" -t \$(android list targets -c | tail -n 1)\
  && PATH=\$PATH:/usr/sbin/ ANDROID_SDK_ROOT=\$(which android | xargs dirname | xargs dirname)/libexec \$(which android | xargs dirname | xargs dirname)/libexec/tools/emulator -avd $app -no-skin -no-boot-anim" &

sleep 30
read -t 360  -p "Press enter when emulator is running..." yn

nix-shell -p androidsdk jre8 which nodejs-5_x --run "cd $app; ADB_INSTALL_TIMEOUT=16 ANDROID_HOME=\$(which android | xargs dirname | xargs dirname)/libexec node ./node_modules/react-native-cli/index.js run-android"
