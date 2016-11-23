#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash
set -eu

./run-web.sh
./run-macos.sh
./run-ios.sh
./run-android.sh

