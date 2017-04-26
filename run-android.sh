#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p nix bash
set -eu
source ./nix-shell-init.sh

port=${1:-8081}

androidDevice="7in WSVGA (Tablet)"
androidSkin="WXGA800"

app=$(basename $PWD)

./build.sh

cp -fR files/* $app/

# Apparently qemu requires write permissions to the image... hmm...
nix-shell -p which file --run "chmod u+w $app/android/androidsdk/libexec/system-images/android-*/x86_64/system.img"

# include /usr/sbin to path to provide system_profiler on osx
nix-shell -p jre8 which file --run "\
     ANDROID_SDK_ROOT=\$(pwd)/$app/android/androidsdk/libexec $app/android/androidsdk/bin/android create avd -f -n $app -b default/x86_64 -d \"$androidDevice\" -t \$($app/android/androidsdk/bin/android list targets -c | tail -n 1) -s $androidSkin\
  && PATH=\$PATH:/usr/sbin/ ANDROID_SDK_ROOT=\$(pwd)/$app/android/androidsdk/libexec \$(pwd)/$app/android/androidsdk/libexec/tools/emulator -avd $app -no-boot-anim" &

sleep 30
read -t 360  -p "Press enter when emulator is running..." yn

nix-shell -p jre8 which nodejs --run "cd $app; ADB_INSTALL_TIMEOUT=16 ANDROID_HOME=\$(pwd)/$app/android/androidsdk/libexec ./node_modules/.bin/react-native run-android"
