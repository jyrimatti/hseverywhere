#!/bin/sh

# copy-pasted from /.nix-profile/etc/profile.d/nix.sh to make SSL work:
NIX_LINK="$HOME/.nix-profile"

# always use a specific nixpkgs revision
export NIX_PATH=nixpkgs=$(cat nix-revision.txt)

export NIXPKGS_CONFIG=$PWD/nixpkgs.config
