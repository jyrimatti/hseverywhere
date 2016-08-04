#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash
set -eu

./package-web.sh
./package-osx.sh
./package-android.sh

