#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p nix bash
set -eux
source ./nix-shell-init.sh

app=$(basename $PWD)

cp register_addons*.js $app/

nix-shell -p nodejs-5_x --run "cd $app && cat ../addons.txt | xargs -L1 npm install"
nix-shell -p nodejs-5_x --run "cd $app && cat ../addons.txt | sed 's/@.*//' | xargs -L1 node_modules/rnpm/bin/cli link"
