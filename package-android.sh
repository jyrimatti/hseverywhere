#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p nix bash cacert
set -eu
source ./nix-shell-init.sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
app=$(basename *.cabal .cabal)

./build.sh

cp -fR files/. rnproject/

nix-shell -p nodejs jre8 --run "cd rnproject/android; ANDROID_HOME=$DIR/rnproject/android/androidsdk/libexec ./gradlew --no-daemon assembleRelease"

test -d release || mkdir release
test -f release/$app.apk && rm release/$app.apk
cp rnproject/android/app/build/outputs/apk/app-release.apk release/$app.apk
echo "Generated release/$app.apk"
