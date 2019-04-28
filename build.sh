#! /usr/bin/env nix-shell
#! nix-shell --pure -i bash -p nix bash cacert rsync
set -eu
source ./nix-shell-init.sh

app=$(basename *.cabal .cabal)

nix-shell --run "cabal configure --ghcjs && cabal build"

sed -i 's/function h$ap_1_0(h$RTS_577)/function h$ap_1_0_deleted(h$RTS_577)/' dist/build/$app/$app.jsexe/all.js
sed -i '0,/function h$ghcjsbn_toDouble_b(nonNeg, b) {/s/function h$ghcjsbn_toDouble_b(nonNeg, b) {/function h$ghcjsbn_toDouble_b_deleted(nonNeg, b) {/' dist/build/$app/$app.jsexe/all.js
sed -i '0,/function h$ghcjszmprimZCGHCJSziPrimziJSVal_con_e/s/function h$ghcjszmprimZCGHCJSziPrimziJSVal_con_e/function h$ghcjszmprimZCGHCJSziPrimziJSVal_con_e_deleted/' dist/build/$app/$app.jsexe/all.js
sed -i '0,/function h$integerzmgmpZCGHCziIntegerziTypeziJnzh_con_e/s/function h$integerzmgmpZCGHCziIntegerziTypeziJnzh_con_e/function h$integerzmgmpZCGHCziIntegerziTypeziJnzh_con_e_deleted/' dist/build/$app/$app.jsexe/all.js
sed -i '0,/function h$integerzmgmpZCGHCziIntegerziTypeziJpzh_con_e/s/function h$integerzmgmpZCGHCziIntegerziTypeziJpzh_con_e/function h$integerzmgmpZCGHCziIntegerziTypeziJpzh_con_e_deleted/' dist/build/$app/$app.jsexe/all.js
sed -i '0,/function h$integerzmgmpZCGHCziIntegerziTypeziSzh_con_e/s/function h$integerzmgmpZCGHCziIntegerziTypeziSzh_con_e/function h$integerzmgmpZCGHCziIntegerziTypeziSzh_con_e_deleted/' dist/build/$app/$app.jsexe/all.js

sed -i 's/use strict//g' dist/build/$app/$app.jsexe/all.js

rsync --checksum dist/build/$app/$app.jsexe/all.js rnproject/
