#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash
set -eu

# android/macos packaging apparently goes through all deps in node_modules, and fails on these symlinks
(test ! -L rnproject/node_modules/react-native/third-party/glog-0.3.4/test-driver) || unlink rnproject/node_modules/react-native/third-party/glog-0.3.4/test-driver
(test ! -L rnproject/node_modules/react-native-macos/third-party/glog-0.3.4/test-driver) || unlink rnproject/node_modules/react-native-macos/third-party/glog-0.3.4/test-driver
(test ! -L rnproject/node_modules/@react-native-community/cli/node_modules/xcode/node_modules/.bin/uuid) || unlink rnproject/node_modules/@react-native-community/cli/node_modules/xcode/node_modules/.bin/uuid
(test ! -L rnproject/node_modules/fsevents/node_modules/.bin/node-pre-gyp) || unlink rnproject/node_modules/fsevents/node_modules/.bin/node-pre-gyp
(test ! -L rnproject/node_modules/node-pre-gyp/node_modules/.bin/needle) || unlink rnproject/node_modules/node-pre-gyp/node_modules/.bin/needle
(test ! -L rnproject/node_modules/node-pre-gyp/node_modules/.bin/detect-libc) || unlink rnproject/node_modules/node-pre-gyp/node_modules/.bin/detect-libc
(test ! -L rnproject/node_modules/node-pre-gyp/node_modules/.bin/nopt) || unlink rnproject/node_modules/node-pre-gyp/node_modules/.bin/nopt
(test ! -L rnproject/node_modules/metro-babel-register/node_modules/@babel/core/node_modules/.bin/json5) || unlink rnproject/node_modules/metro-babel-register/node_modules/@babel/core/node_modules/.bin/json5
(test ! -L rnproject/node_modules/metro-babel-register/node_modules/@babel/plugin-proposal-optional-chaining/node_modules/@babel/core/node_modules/.bin/json5) || unlink rnproject/node_modules/metro-babel-register/node_modules/@babel/plugin-proposal-optional-chaining/node_modules/@babel/core/node_modules/.bin/json5
(test ! -L rnproject/node_modules/metro-babel-register/node_modules/@babel/plugin-proposal-optional-chaining/node_modules/@babel/plugin-syntax-optional-chaining/node_modules/@babel/core/node_modules/.bin/json5) || unlink rnproject/node_modules/metro-babel-register/node_modules/@babel/plugin-proposal-optional-chaining/node_modules/@babel/plugin-syntax-optional-chaining/node_modules/@babel/core/node_modules/.bin/json5
(test ! -L rnproject/node_modules/react-native/node_modules/@babel/core/node_modules/.bin/json5) || unlink rnproject/node_modules/react-native/node_modules/@babel/core/node_modules/.bin/json5
(test ! -L rnproject/node_modules/babel-preset-fbjs/node_modules/@babel/plugin-syntax-flow/node_modules/@babel/core/node_modules/.bin/json5) || unlink rnproject/node_modules/babel-preset-fbjs/node_modules/@babel/plugin-syntax-flow/node_modules/@babel/core/node_modules/.bin/json5
(test ! -L rnproject/node_modules/babel-preset-fbjs/node_modules/@babel/plugin-proposal-class-properties/node_modules/@babel/core/node_modules/.bin/json5) || unlink rnproject/node_modules/babel-preset-fbjs/node_modules/@babel/plugin-proposal-class-properties/node_modules/@babel/core/node_modules/.bin/json5
(test ! -L rnproject/node_modules/babel-preset-fbjs/node_modules/@babel/plugin-transform-function-name/node_modules/@babel/core/node_modules/.bin/json5) || unlink rnproject/node_modules/babel-preset-fbjs/node_modules/@babel/plugin-transform-function-name/node_modules/@babel/core/node_modules/.bin/json5
(test ! -L rnproject/node_modules/babel-preset-fbjs/node_modules/@babel/plugin-transform-computed-properties/node_modules/@babel/core/node_modules/.bin/json5) || unlink rnproject/node_modules/babel-preset-fbjs/node_modules/@babel/plugin-transform-computed-properties/node_modules/@babel/core/node_modules/.bin/json5
(test ! -L rnproject/node_modules/babel-preset-fbjs/node_modules/@babel/plugin-transform-classes/node_modules/@babel/core/node_modules/.bin/json5) || unlink rnproject/node_modules/babel-preset-fbjs/node_modules/@babel/plugin-transform-classes/node_modules/@babel/core/node_modules/.bin/json5
(test ! -L rnproject/node_modules/babel-preset-fbjs/node_modules/@babel/core/node_modules/.bin/json5) || unlink rnproject/node_modules/babel-preset-fbjs/node_modules/@babel/core/node_modules/.bin/json5
(test ! -L rnproject/node_modules/babel-preset-fbjs/node_modules/@babel/plugin-transform-destructuring/node_modules/@babel/core/node_modules/.bin/json5) || unlink rnproject/node_modules/babel-preset-fbjs/node_modules/@babel/plugin-transform-destructuring/node_modules/@babel/core/node_modules/.bin/json5
(test ! -L rnproject/node_modules/babel-preset-fbjs/node_modules/@babel/plugin-transform-react-display-name/node_modules/@babel/core/node_modules/.bin/json5) || unlink rnproject/node_modules/babel-preset-fbjs/node_modules/@babel/plugin-transform-react-display-name/node_modules/@babel/core/node_modules/.bin/json5
(test ! -L rnproject/node_modules/babel-preset-fbjs/node_modules/@babel/plugin-transform-literals/node_modules/@babel/core/node_modules/.bin/json5) || unlink rnproject/node_modules/babel-preset-fbjs/node_modules/@babel/plugin-transform-literals/node_modules/@babel/core/node_modules/.bin/json5
(test ! -L rnproject/node_modules/babel-preset-fbjs/node_modules/@babel/plugin-transform-parameters/node_modules/@babel/core/node_modules/.bin/json5) || unlink rnproject/node_modules/babel-preset-fbjs/node_modules/@babel/plugin-transform-parameters/node_modules/@babel/core/node_modules/.bin/json5
(test ! -L rnproject/node_modules/babel-preset-fbjs/node_modules/@babel/plugin-transform-spread/node_modules/@babel/core/node_modules/.bin/json5) || unlink rnproject/node_modules/babel-preset-fbjs/node_modules/@babel/plugin-transform-spread/node_modules/@babel/core/node_modules/.bin/json5
(test ! -L rnproject/node_modules/babel-preset-fbjs/node_modules/@babel/plugin-transform-template-literals/node_modules/@babel/core/node_modules/.bin/json5) || unlink rnproject/node_modules/babel-preset-fbjs/node_modules/@babel/plugin-transform-template-literals/node_modules/@babel/core/node_modules/.bin/json5
(test ! -L rnproject/node_modules/babel-preset-fbjs/node_modules/@babel/plugin-transform-modules-commonjs/node_modules/@babel/core/node_modules/.bin/json5) || unlink rnproject/node_modules/babel-preset-fbjs/node_modules/@babel/plugin-transform-modules-commonjs/node_modules/@babel/core/node_modules/.bin/json5
(test ! -L rnproject/node_modules/metro/node_modules/@babel/core/node_modules/.bin/json5) || unlink rnproject/node_modules/metro/node_modules/@babel/core/node_modules/.bin/json5
(test ! -L rnproject/node_modules/metro-babel-transformer/node_modules/@babel/core/node_modules/.bin/json5) || unlink rnproject/node_modules/metro-babel-transformer/node_modules/@babel/core/node_modules/.bin/json5
(test ! -L rnproject/node_modules/@babel/plugin-syntax-optional-chaining/node_modules/@babel/core/node_modules/.bin/json5) || unlink rnproject/node_modules/@babel/plugin-syntax-optional-chaining/node_modules/@babel/core/node_modules/.bin/json5
(test ! -L rnproject/node_modules/@babel/plugin-syntax-jsx/node_modules/@babel/core/node_modules/.bin/json5) || unlink rnproject/node_modules/@babel/plugin-syntax-jsx/node_modules/@babel/core/node_modules/.bin/json5
(test ! -L rnproject/node_modules/@babel/plugin-syntax-optional-catch-binding/node_modules/@babel/core/node_modules/.bin/json5) || unlink rnproject/node_modules/@babel/plugin-syntax-optional-catch-binding/node_modules/@babel/core/node_modules/.bin/json5
(test ! -L rnproject/node_modules/@babel/plugin-syntax-nullish-coalescing-operator/node_modules/@babel/core/node_modules/.bin/json5) || unlink rnproject/node_modules/@babel/plugin-syntax-nullish-coalescing-operator/node_modules/@babel/core/node_modules/.bin/json5
(test ! -L rnproject/node_modules/@babel/plugin-syntax-typescript/node_modules/@babel/core/node_modules/.bin/json5) || unlink rnproject/node_modules/@babel/plugin-syntax-typescript/node_modules/@babel/core/node_modules/.bin/json5
(test ! -L rnproject/node_modules/@babel/helper-create-class-features-plugin/node_modules/@babel/core/node_modules/.bin/json5) || unlink rnproject/node_modules/@babel/helper-create-class-features-plugin/node_modules/@babel/core/node_modules/.bin/json5
(test ! -L rnproject/node_modules/@babel/plugin-syntax-object-rest-spread/node_modules/@babel/core/node_modules/.bin/json5) || unlink rnproject/node_modules/@babel/plugin-syntax-object-rest-spread/node_modules/@babel/core/node_modules/.bin/json5