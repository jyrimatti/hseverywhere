#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p nix bash cacert curl
set -eu
source ./nix-shell-init.sh

### Note! Note pure, requires xcodebuild and hdiutil! ###

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
app=$(basename *.cabal .cabal)

./build.sh

cp -fR files/. rnproject/

./remove-symlinks.sh

test -d release || mkdir release
test -f release/$app.dmg && rm release/$app.dmg
nix-shell -p nodejs-10_x --run "(cd rnproject/macos && PATH=/usr/bin:\$PATH PLATFORM=macos /usr/bin/xcodebuild -UseModernBuildSystem=NO -xcconfig $DIR/rnproject/.xcconfig -scheme rnproject -configuration Release -target rnproject archive -archivePath $DIR/dist/rnproject.xcarchive)"

/usr/bin/hdiutil create -volname rnproject -srcfolder dist/rnproject.xcarchive/Products/Applications/rnproject.app -ov -format UDZO release/$app.dmg

echo "Generated release/$app.dmg"
