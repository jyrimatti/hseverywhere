#!/bin/sh

# need the cacert-things from there, otherwise SSL in --pure shells doesn't work
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then . ~/.nix-profile/etc/profile.d/nix.sh; fi

# always use a specific nixpkgs revision
export NIX_PATH=nixpkgs=https://github.com/NixOS/nixpkgs-channels/archive/$(cat nix-revision.txt).tar.gz
