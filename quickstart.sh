#! /bin/sh
set -eu

./init.sh
#./init-windows.bat
./package-all.sh
./build.sh
./start-packagers.sh &
./run-all.sh
