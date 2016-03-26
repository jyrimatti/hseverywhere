'use strict';
require('./require_app');
setTimeout(function() {
    var { AppRegistry } = require('react-native');
    AppRegistry.runApplication('actual-app', { initialProps: {hs: 'haskell-stuff needs this for whatever reason'}, rootTag: document.getElementById('react-root') })
}, 0);
