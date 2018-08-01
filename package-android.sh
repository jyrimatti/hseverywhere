#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p nix bash cacert
set -eu
source ./nix-shell-init.sh

app=$(basename $PWD)

./build.sh

cp -fR files/. $app/

nix-shell -p nodejs jre8 --run "cd $app/android; ANDROID_HOME=$(pwd)/$app/android/androidsdk/libexec ./gradlew --no-daemon assembleRelease"

test -d release || mkdir release
test -f release/$app.apk && rm release/$app.apk
cp $app/android/app/build/outputs/apk/app-release.apk release/$app.apk
echo "Generated release/$app.apk"
