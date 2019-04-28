#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash
set -eu
source ./nix-shell-init.sh

editor=${REACT_EDITOR:-xdg-open}

mobileport=${1:-8081}
macosport=${2:-8082}
webport=${3:-8083}

cp -fR files/. rnproject/
cd rnproject

echo "Ensure you have enough file descriptors if you get 'Too many open files': https://facebook.github.io/watchman/docs/install.html"

nix-shell -p nodejs-10_x xdg_utils watchman --run "REACT_EDITOR='$editor' PORT=$webport    npm run start-web    | sed 's/^/[Web   ] /' || echo '[Web   ] Died!'" &
nix-shell -p nodejs-10_x xdg_utils watchman --run "REACT_EDITOR='$editor' PORT=$macosport  npm run start-macos  | sed 's/^/[MacOS ] /' || echo '[MacOS ] Died!'" &
nix-shell -p nodejs-10_x xdg_utils watchman --run "REACT_EDITOR='$editor' PORT=$mobileport npm run start-mobile | sed 's/^/[Mobile] /' || echo '[Mobile] Died!'"
