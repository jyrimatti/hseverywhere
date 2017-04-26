#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p nix bash
set -eu
source ./nix-shell-init.sh

app=$(basename $PWD)
buildToolsVersion=$(nix-store --query --references $(nix-instantiate '<nixpkgs>' -A androidsdk) | grep 'android-build-tools' | sed 's/.*build-tools-r\(.*\).drv/\1/')

cp register_addons*.js $app/

nix-shell -p nodejs --run "cd $app && cat ../addons.txt | grep -v '^#' | xargs -L1 npm install --save"
nix-shell -p nodejs --run "cd $app && cat ../addons.txt | grep -v '^#' | sed 's/@.*//' | xargs -L1 node_modules/rnpm/bin/cli link"

# change addon android buildTools version to that available from nixpkgs
cd $app && cat ../addons.txt | grep -v '^#' | sed 's/@.*//' | xargs -I {} sed -i "s/buildToolsVersion \"[^\"]*\"/buildToolsVersion \"$buildToolsVersion\"/" node_modules/{}/android/build.gradle || true