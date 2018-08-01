#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p nix bash cacert curl
set -eu
source ./nix-shell-init.sh

### Note! Note pure, requires xcodebuild and hdiutil! ###

app=$(basename $PWD)

./build.sh

cp -fR files/. $app/

test -d release || mkdir release
test -f release/$app.dmg && rm release/$app.dmg
dir=$PWD
nix-shell -p nodejs-9_x --run "(cd $app/macos && PLATFORM=macos /usr/bin/xcodebuild -xcconfig $dir/$app/.xcconfig -scheme $app -configuration Release -target $app archive -archivePath $dir/dist/$app.xcarchive)"

/usr/bin/hdiutil create -volname $app -srcfolder dist/$app.xcarchive/Products/Applications/$app.app -ov -format UDZO release/$app.dmg

echo "Generated release/$app.dmg"
