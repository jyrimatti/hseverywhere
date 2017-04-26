#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p nodejs watchman
set -eu
source ./nix-shell-init.sh

mobileport=${1:-8081}
macosport=${2:-8082}
webport=${3:-8083}

app=$(basename $PWD)

cp -fR files/* $app/
cd $app

(PORT=$webport npm run start-web       | sed 's/^/[Web   ] /' || echo "[Web   ] Died!") &
(PORT=$macosport npm run start-macos   | sed 's/^/[MacOS ] /' || echo "[MacOS ] Died!") &
(PORT=$mobileport npm run start-mobile | sed 's/^/[Mobile] /' || echo "[Mobile] Died!")
