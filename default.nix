{ nixpkgs ? import <nixpkgs> {}, compiler ? "ghcjs" }:

let

  inherit (nixpkgs) pkgs;

  hp = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  haskellPackages = hp.override (old: {
    overrides = pkgs.lib.composeExtensions (old.overrides or (_: _: {})) (self: super: {
      QuickCheck = pkgs.haskell.lib.dontCheck super.QuickCheck;
    });
  });

  myproject = { mkDerivation, base, deepseq, ghcjs-base, react-hs, react-native-hs, stdenv, nodejs,
        text, time, transformers, containers, network-uri
      }:
      mkDerivation {
        pname = "myproject";
        version = "0.1.0.0";
        src = if pkgs.lib.inNixShell then null else ./.;
        isLibrary = false;
        isExecutable = true;
        executableHaskellDepends = [
          base deepseq ghcjs-base react-hs react-native-hs text time transformers containers network-uri
        ];
        buildDepends = [pkgs.haskellPackages.cabal-install] ++
          (if compiler == "default"
             then with pkgs.haskellPackages; [nodejs hlint stack intero hasktags pointfree hdevtools stylish-haskell hindent (hoogle.override { process-extras = pkgs.haskell.lib.dontCheck process-extras; }) (apply-refact.override { ghc-exactprint = pkgs.haskell.lib.dontCheck ghc-exactprint; })]
             else []);
        license = stdenv.lib.licenses.mit;
      };

  ghcjsbase = if compiler == "default"
                 then haskellPackages.ghcjs-base-stub
                 else haskellPackages.ghcjs-base;

  # my fork, until it gets to Hackage
  react-hs-forked = { fetchgit, stdenv, mkDerivation,
        aeson, base, bytestring, ghcjs-base, mtl, string-conversions,
        template-haskell, text, time, unordered-containers
     }:
     mkDerivation {
       pname = "react-hs";
       version = "0.1.1";
       src = fetchgit {
         url = "https://github.com/jyrimatti/react-hs.git";
         sha256 = "0s7c15pmfhlccr6qgl6jn6izbvnqchh739i0h0sx1yiaarqwmzwy";
         rev = "9390f850861102e84e38514a577ce7f3b1aac23f";
       };
       postUnpack = "sourceRoot=$sourceRoot/react-hs";
       libraryHaskellDepends = [
         aeson base bytestring ghcjs-base mtl string-conversions
         template-haskell text time unordered-containers
       ];
       homepage = "https://github.com/jyrimatti/react-hs";
       description = "A binding to React based on the Flux application architecture for GHCJS";
       license = stdenv.lib.licenses.bsd3;
     };

  react-native-hs-git = { fetchgit, mkDerivation, base, deepseq, ghcjs-base, react-hs, stdenv, nodejs,
        text, time, transformers, containers, network-uri
     }:
     mkDerivation {
       pname = "react-native-hs";
       version = "0.1.1";
       src = fetchgit {
         url = "https://github.com/jyrimatti/react-native-hs.git";
         sha256 = "0f6bzm072wxp47bxxyhf5vgz8yac7107prixga341bkxblzj56zy";
         rev = "edbed40baa5391c907c42657f5365e62e4cc02ef";
       };
       libraryHaskellDepends = [
        react-hs text time transformers containers network-uri
       ];
       homepage = "https://github.com/jyrimatti/react-native-hs";
       description = "React-native support for react-hs";
       license = stdenv.lib.licenses.mit;
     };

  react-native-hs-local = { mkDerivation, base, deepseq, ghcjs-base, react-hs, stdenv, nodejs,
        text, time, transformers, containers, network-uri
     }:
     mkDerivation {
       pname = "react-native-hs";
       version = "0.1.1";
       src = ../react-native-hs/.;
       libraryHaskellDepends = [
        react-hs text time transformers containers network-uri
       ];
       homepage = "https://github.com/jyrimatti/react-native-hs";
       description = "React-native support for react-hs";
       license = stdenv.lib.licenses.mit;
     };

  react-hs = haskellPackages.callPackage react-hs-forked { ghcjs-base = ghcjsbase; };

  #react-native-hs = haskellPackages.callPackage react-native-hs-local { react-hs = react-hs; ghcjs-base = ghcjsbase; };
  react-native-hs = haskellPackages.callPackage react-native-hs-git { react-hs = react-hs; ghcjs-base = ghcjsbase; };

  drv = haskellPackages.callPackage myproject { react-hs = react-hs; react-native-hs = react-native-hs; ghcjs-base = ghcjsbase; };

in

  if pkgs.lib.inNixShell then drv.env else drv
