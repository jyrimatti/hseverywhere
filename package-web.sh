#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p nix bash
set -eu
source ./nix-shell-init.sh

app=$(basename $PWD)

nix-shell --run "cabal clean && cabal build $app"
cp -f dist/build/$app/$app.jsexe/all.js $app/

cp -f dist/build/$app/$app.jsexe/all.js $app/
cp -fR files/* $app/
mv $app/rn-cli.config.others.js $app/rn-cli.config.js

nix-shell -p nodejs-5_x --run "cd $app && npm run pack"

echo "<!doctype html><html><head><meta charset='utf-8'><title>$app</title></head><body><section id='react-root'/><script type='text/javascript'>" > dist/$app.html
echo "//<![CDATA[" >> dist/$app.html
cat dist/bundle.js >> dist/$app.html
echo "//]]>" >> dist/$app.html
echo "</script></body></html>" >> dist/$app.html

echo "Generated dist/$app.html"
