#!/bin/sh
set -eu

port=${1:-8084}

app=$(basename $PWD)

cp -f dist/build/$app/$app.jsexe/all.js $app/
cp -fR files/* $app/
mv $app/rn-cli.config.others.js $app/rn-cli.config.js

open http://localhost:$port/

nix-shell -p nodejs-5_x --run "cd $app && PORT=$port npm run start-web"

