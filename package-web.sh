#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p nix bash
set -eu
source ./nix-shell-init.sh

app=$(basename $PWD)

./build.sh

cp -fR files/* $app/

nix-shell -p nodejs --run "cd $app && npm run pack"

test -d release || mkdir release
test -f release/$app.html && rm release/$app.html
echo "<!doctype html><html><head><meta charset='utf-8'><title>$app</title></head><body><section id='react-root'/><script type='text/javascript'>" > release/$app.html
echo "//<![CDATA[" >> release/$app.html
cat dist/bundle.js >> release/$app.html
echo "//]]>" >> release/$app.html
echo "</script></body></html>" >> release/$app.html

echo "Generated release/$app.html"
