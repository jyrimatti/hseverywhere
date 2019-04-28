#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p nix bash cacert
set -eu
source ./nix-shell-init.sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
app=$(basename *.cabal .cabal)

./build.sh

cp -fR files/. rnproject/

./remove-symlinks.sh

nix-shell -p nodejs-10_x jre8 watchman --run "cd rnproject/android; ANDROID_HOME=$DIR/rnproject/android/androidsdk/libexec ANDROID_NDK=$DIR/rnproject/android/androidsdk/libexec/android-sdk/ndk-bundle ./gradlew --no-daemon assembleRelease --stacktrace"

test -d release || mkdir release
test -f release/$app.apk && rm release/$app.apk
cp rnproject/android/app/build/outputs/apk/release/app-release.apk release/$app.apk
echo "Generated release/$app.apk"
