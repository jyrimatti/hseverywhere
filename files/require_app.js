
window.React = require('react');

window.__registerComponent = function(name,c) {
    var { doRegister } = require('./register');
    var { AppRegistry } = require('react-native');
    doRegister(name,c,AppRegistry);
};

if (!window.navigator) {
  window.navigator = {};
  window.navigator.userAgent = 'react-native';
}

var { registerRnComponents } = require('./register_rn');
var { registerAddons } = require('./register_addons');
var __rn = require('react-native');

module.exports = {
  RegRn: registerRnComponents(__rn),
  RegAddons: registerAddons(__rn.Platform.OS),
  Runmain: require('./all'),
  Repl: require('./ghcjsiClient')
};

