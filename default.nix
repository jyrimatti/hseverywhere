{ nixpkgs ? import <nixpkgs> {}, compiler ? "ghcjs" }:

let

  inherit (nixpkgs) pkgs;

  f = { mkDerivation, base, deepseq, ghcjs-base, react-flux, stdenv
      , text, time, transformers
      }:
      mkDerivation {
        pname = "hsEverywhere";
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

  # add missing ghcjs-base to react-flux
  reactFlux = haskellPackages.react-flux.override (args: args // {
    mkDerivation = expr: args.mkDerivation (expr // {
        libraryHaskellDepends = expr.libraryHaskellDepends ++ [haskellPackages.ghcjs-base];
    });
  });

  drv = haskellPackages.callPackage f { react-flux = reactFlux; };

in

  if pkgs.lib.inNixShell then drv.env else drv
