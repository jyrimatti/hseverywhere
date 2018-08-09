#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash
set -eux

./build.sh

cp -fR files/. rnproject/

./run-ios.sh
./run-web.sh
./run-macos.sh
./run-android.sh