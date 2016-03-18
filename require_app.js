React = require('react');

__registerComponent = function(name,c) {
    var { AppRegistry, View, Text } = require('react-native');
    window.Text = Text;
    window.View = View;

    var renderApplication = require('renderApplication');
    // gotta pass in empty object manually as initProps, otherwise fails on undefined
    AppRegistry.registerRunnable(name, function(appParameters) { return renderApplication(c, {hs: 'dummy'}, appParameters.rootTag) });
};

module.exports = {
    Runmain: require('./all')
}
