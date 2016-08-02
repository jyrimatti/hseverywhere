#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p nodejs-5_x
set -eu
source ./nix-shell-init.sh

mobileport=${1:-8081}
osxport=${2:-8083}
webport=${3:-8084}

app=$(basename $PWD)

cp -fR files/* $app/
cd $app

PORT=$webport npm run start-web &
PORT=$osxport npm run start-osx &
PORT=$mobileport npm run start-mobile
