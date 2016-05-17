'use strict';
var { Runmain } = require('./require_app_others');
for(var exported in Runmain) {
  window[exported] = Runmain[exported];
}

setTimeout(function() {
    var { AppRegistry } = require('react-native');
    AppRegistry.runApplication('actual-app', { initialProps: {hs: 'haskell-stuff needs this for whatever reason'}, rootTag: document.getElementById('react-root') })
}, 0);
