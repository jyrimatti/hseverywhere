#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p nix bash
set -eux
source ./nix-shell-init.sh

buildToolsVersion=$(nix-store --query --references $(nix-instantiate '<nixpkgs>' -A androidsdk_9_0) | grep 'build-tools' | sed 's/.*build-tools-\([^.]*\).*.drv/\1/')

cp -fR files/. rnproject/
cp register_addons*.js rnproject/

nix-shell -p nodejs-10_x --run "cd rnproject && cat ../addons.txt | grep -v '^#' | sed 's/@.*//' | xargs -L1 node_modules/.bin/react-native link || echo Link returned failure for some reason..."

# change addon android buildTools version to that available from nixpkgs
(cat addons.txt | grep -v '^#' | sed 's/@.*//' | xargs -I {} sed -i "s/buildToolsVersion [\"'][^\"']*[\"']/buildToolsVersion \"$buildToolsVersion\"/g" rnproject/node_modules/{}/android/build.gradle) || echo returned error...

echo "init-addons done"
