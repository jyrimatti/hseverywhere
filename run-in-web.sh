#! /usr/bin/env nix-shell
#! nix-shell -i bash -p nix bash
set -eu
source ./nix-shell-init.sh

port=${1:-8084}

app=$(basename $PWD)

./build.sh

cp -fR files/* $app/
mv $app/rn-cli.config.others.js $app/rn-cli.config.js

nix-shell -p xdg_utils --run "xdg-open http://localhost:$port/"

nix-shell --pure -p nodejs-5_x --run "cd $app && PORT=$port npm run start-web"

