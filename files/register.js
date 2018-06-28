
var doRegister = function(name,c,AppRegistry) {
    AppRegistry.registerComponent("actual-app", function() { return c; });
    AppRegistry.registerRunnable(name, function(appParameters) {
        return AppRegistry.runApplication("actual-app", appParameters);
    });
};

module.exports = {
  doRegister: doRegister
};

