#! /usr/bin/env nix-shell
#! nix-shell -i bash -p nix bash
set -eu
source ./nix-shell-init.sh

app=$(basename $PWD)

#nix-shell --run "nix-shell -p ctags -p \"haskellPackages.ghcWithPackages (p: [p.stylish-haskell p.hdevtools p.ghc-mod (p.hoogle.override { process-extras = haskell.lib.dontCheck p.process-extras; }) p.hasktags p.pointfree p.hsdev p.apply-refact.override { ghc-exactprint = haskell.lib.dontCheck p.ghc-exactprint; }])\" --run \"open -n -a 'Sublime Text' .\""
nix-shell --argstr compiler 'default'  --run "nix-shell -I 'nixpkgs=https://github.com/NixOS/nixpkgs/archive/bfff24189cae0bf6eceacd5c3e4d8464ba72b895.tar.gz' -p ctags -p haskellPackages.hsdev -p haskellPackages.hdevtools -p haskellPackages.ghc-mod -p haskellPackages.stylish-haskell -p \"haskellPackages.ghcWithPackages (p: [(p.hoogle.override { process-extras = haskell.lib.dontCheck p.process-extras; })])\" -p haskellPackages.hasktags -p haskellPackages.pointfree -p \"haskellPackages.ghcWithPackages (p: [(p.apply-refact.override { ghc-exactprint = haskell.lib.dontCheck p.ghc-exactprint; })])\" --run \"open -n -a 'Sublime Text' .\""
