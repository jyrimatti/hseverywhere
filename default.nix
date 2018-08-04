{ nixpkgs ? import <nixpkgs> {}, compiler ? "ghcjsHEAD" }:

let

  inherit (nixpkgs) pkgs;

  f = { mkDerivation, base, deepseq, ghcjs-base, react-hs, stdenv, nodejs,
        text, time, transformers, containers, http-common, network-uri, semigroups
      }:
      mkDerivation {
        pname = "myproject";
        version = "0.1.0.0";
        src = ./.;
        isLibrary = false;
        isExecutable = true;
        executableHaskellDepends = [
          base deepseq ghcjs-base react-hs text time transformers containers http-common network-uri semigroups
        ];
        buildDepends = [pkgs.haskellPackages.cabal-install] ++
          (if compiler == "default"
             then with pkgs.haskellPackages; [nodejs hlint stack intero hasktags pointfree hdevtools stylish-haskell hindent (hoogle.override { process-extras = pkgs.haskell.lib.dontCheck process-extras; }) (apply-refact.override { ghc-exactprint = pkgs.haskell.lib.dontCheck ghc-exactprint; })]
             else []);
        license = stdenv.lib.licenses.mit;
      };

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  ghcjsbase = if compiler == "default"
                 then haskellPackages.ghcjs-base-stub
                 else haskellPackages.ghcjs-base;

  react-hs = haskellPackages.callPackage ./react-hs/react-hs/default.nix { ghcjs-base = ghcjsbase; };

  drv = haskellPackages.callPackage f { react-hs = react-hs; ghcjs-base = ghcjsbase; };

in

  if pkgs.lib.inNixShell then drv.env else drv
