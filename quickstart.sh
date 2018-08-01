#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash
set -eu

./init.sh
./init-windows.bat
./package-all.sh
./run-all.sh
./start-packagers.sh
