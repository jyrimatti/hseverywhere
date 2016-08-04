#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p nodejs-5_x
set -eu
source ./nix-shell-init.sh

mobileport=${1:-8081}
osxport=${2:-8082}
webport=${3:-8083}

app=$(basename $PWD)

cp -fR files/* $app/
cd $app

(PORT=$webport npm run start-web       | sed 's/^/[Web   ] /' || echo "[Web   ] Died!") &
(PORT=$osxport npm run start-osx       | sed 's/^/[OSX   ] /' || echo "[OSX   ] Died!") &
(PORT=$mobileport npm run start-mobile | sed 's/^/[Mobile] /' || echo "[Mobile] Died!")
