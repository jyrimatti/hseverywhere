#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p nix bash
set -eu
source ./nix-shell-init.sh

### Note! Note pure, requires xcodebuild and hdiutil! ###

app=$(basename $PWD)

./cleanbuild.sh

cp -fR files/* $app/

test -d release || mkdir release
rm release/$app.dmg
dir=$PWD
nix-shell -p nodejs-5_x --run "cd $app/osx && PLATFORM=osx /usr/bin/xcodebuild -scheme $app -configuration Release -target $app archive -archivePath $dir/dist/$app.xcarchive"
/usr/bin/hdiutil create -volname $app -srcfolder dist/$app.xcarchive/Products/Applications/$app.app -ov -format UDZO release/$app.dmg

echo "Generated release/$app.dmg"
