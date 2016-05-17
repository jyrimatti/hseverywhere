
window.React = require('react');

window.__registerComponent = function(name,c) {
    var { doRegister } = require('./require_app');
    var { AppRegistry } = require('react-native-desktop');
    doRegister(name,c,AppRegistry);
};

window.navigator = window.navigator || {};
window.navigator.userAgent = window.navigator.userAgent || 'react-native';

var { registerRnComponents } = require('./register_rn');
var __rn = require('react-native-desktop');

module.exports = {
  RegRn: registerRnComponents(__rn),
  Runmain: require('./all'),
  Repl: require('./ghcjsiClient')
};

