
window.React = require('react');

window.__registerComponent = function(name,c) {
    var { AppRegistry } = require('react-native');
    AppRegistry.registerComponent("actual-app", function() { return c; });
    AppRegistry.registerRunnable(name, function(appParameters) {
        appParameters.initialProps['hs'] = 'haskell-stuff needs this for whatever reason';
        return AppRegistry.runApplication("actual-app", appParameters);
    });
};

module.exports = {
  RegRn: require('./register_rn'),
  Runmain: require('./all')
};

