var { Runmain } = require('./require_app.web');
for(var exported in Runmain) {
  window[exported] = Runmain[exported];
}

setTimeout(function() {
    var { AppRegistry } = require('react-native');
    AppRegistry.runApplication('actual-app', { rootTag: document.getElementById('react-root') })
}, 2000);
