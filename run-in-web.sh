#!/bin/sh
set -eu

app=$(basename $PWD)

ln -fs ../dist/build/$app/$app.jsexe/all.js $app/all.js

cp -fR files/* $app/

open http://localhost:8080/

nix-shell -p nodejs-5_x --command "cd $app && npm run dev"

