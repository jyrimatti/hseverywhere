#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash
set -eu

./cleanbuild.sh

./package-web.sh
./package-macos.sh
./package-android.sh

