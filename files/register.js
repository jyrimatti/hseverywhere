
var doRegister = function(name,c,AppRegistry) {
    AppRegistry.registerComponent("actual-app", function() { return c; });
    AppRegistry.registerRunnable(name, function(appParameters) {
        if (!appParameters.initialProps)
            appParameters.initialProps = {};
        appParameters.initialProps['hs'] = 'haskell-stuff needs this for whatever reason';
        return AppRegistry.runApplication("actual-app", appParameters);
    });
};

module.exports = {
  doRegister: doRegister
};

