#!/bin/sh
set -eu

app=$(basename $PWD)

cp -f dist/build/$app/$app.jsexe/all.js $app/
cp -fR files/* $app/

open http://localhost:8080/

nix-shell -p nodejs-5_x --command "cd $app && npm run dev"

