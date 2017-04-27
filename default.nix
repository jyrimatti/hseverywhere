{ nixpkgs ? import <nixpkgs> {}, compiler ? "ghcjsHEAD" }:

let

  inherit (nixpkgs) pkgs;

  f = { mkDerivation, base, deepseq, ghcjs-base, react-flux, stdenv
      , text, time, transformers
      }:
      mkDerivation {
        pname = "hseverywhere";
        version = "0.1.0.0";
        src = ./.;
        isLibrary = false;
        isExecutable = true;
        executableHaskellDepends = [
          base deepseq ghcjs-base react-flux text time transformers
        ];
        buildDepends = [pkgs.haskellPackages.cabal-install];
        license = stdenv.lib.licenses.mit;
      };

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  ghcjs-base-stub = haskellPackages.callPackage
    ({ stdenv, mkDerivation, aeson, attoparsec, base, deepseq, ghc-prim
     , primitive, scientific, text, transformers, unordered-containers
     , vector
     }:
     mkDerivation {
       pname = "ghcjs-base-stub";
       version = "0.1.0.2";
       sha256 = "629089740c7fd2349b39a3899bad3692667dfd2ff6443b3e815d2bf3cad60ff5";
       libraryHaskellDepends = [
         aeson attoparsec base deepseq ghc-prim primitive scientific text
         transformers unordered-containers vector
       ];
       homepage = "https://github.com/louispan/javascript-stub#readme";
       description = "Allow GHCJS projects to compile under GHC and develop using intero";
       license = stdenv.lib.licenses.bsd3;
     }) {};

  ghcjsbase = if compiler == "default"
                 then ghcjs-base-stub
                 else haskellPackages.ghcjs-base;

  # add missing ghcjs-base to react-flux
  reactFluxFixed = haskellPackages.react-flux.override (args: args // {
    mkDerivation = expr: args.mkDerivation (expr // {
        libraryHaskellDepends = expr.libraryHaskellDepends ++ [ghcjsbase];
    });
  });

  drv = haskellPackages.callPackage f { react-flux = reactFluxFixed; };

in

  if pkgs.lib.inNixShell then drv.env else drv
