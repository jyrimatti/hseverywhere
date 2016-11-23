var blacklist = require('react-native/packager/blacklist');

var config = {
  getBlacklistRE() {
    return blacklist([
      process.env.PLATFORM !== 'macos' ? /node_modules\/react-native-macos\/.*/ : /node_modules\/react-native\/.*/
    ]);
  }
};
                  
module.exports = config;

