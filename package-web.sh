#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p nix bash cacert
set -eu
source ./nix-shell-init.sh

app=$(basename *.cabal .cabal)

./build.sh

cp -fR files/. rnproject/

nix-shell -p nodejs-10_x --run "cd rnproject && npm run pack"

test -d release || mkdir release
test -f release/$app.html && rm release/$app.html
echo "<!doctype html><html><head><meta charset='utf-8'><title>$app</title></head><body><section id='react-root'/><script type='text/javascript'>" > release/$app.html
echo "//<![CDATA[" >> release/$app.html
cat rnproject/dist/dist/bundle.js >> release/$app.html
echo "//]]>" >> release/$app.html
echo "</script></body></html>" >> release/$app.html

echo "Generated release/$app.html"
