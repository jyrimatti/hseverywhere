
window.React = require('react');

window.__registerComponent = function(name,c) {
    var { doRegister } = require('./require_app');
    var { AppRegistry } = require('react-native-desktop');
    doRegister(name,c,AppRegistry);
};

var { registerRnComponents } = require('./register_rn');
var __rn = require('react-native-desktop');

module.exports = {
  RegRn: registerRnComponents(__rn),
  Runmain: require('./all')
};

