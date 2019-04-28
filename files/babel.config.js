module.exports = function (api) {
    api.cache(false);

    function platform() {
        if (process && (process.env.PLATFORM === 'macos' || process.argv.filter(a => a.indexOf('react-native-macos') > -1).length > 0)) {
            console.log("babel.config.js: macos");
            return {
                "alias": {
                    "react-native": "react-native-macos"
                }
            };
        } else if (process && (process.env.PLATFORM === 'web' || process.argv.filter(a => a.indexOf('react-native-web') > -1).length > 0)) {
            console.log("babel.config.js: web");
            return {
                "alias": {
                    "react-native": "react-native-web"
                }
            };
        }

        console.log("babel.config.js: mobile");
        return {};
    }

    const presets = ["module:metro-react-native-babel-preset"];
    const plugins = [
        ["module-resolver", platform()]
    ];
    const ignore = ["**/all.js"];
  
    return {
      presets,
      plugins,
      ignore
    };
}
