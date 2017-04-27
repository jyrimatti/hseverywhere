#! /usr/bin/env nix-shell
#! nix-shell -i bash -p nix bash
set -eu
source ./nix-shell-init.sh

app=$(basename $PWD)

nix-shell --argstr compiler 'default' --run "nix-shell -p pkgconfig -p ctags -p haskellPackages.hasktags -p haskellPackages.pointfree -p haskellPackages.hsdev -p haskellPackages.hdevtools -p haskellPackages.ghc-mod -p haskellPackages.stylish-haskell -p \"haskellPackages.ghcWithPackages (p: [(p.hoogle.override { process-extras = haskell.lib.dontCheck p.process-extras; }) (p.apply-refact.override { ghc-exactprint = haskell.lib.dontCheck p.ghc-exactprint; })])\" --run \"open -n -a 'Sublime Text' .\""
