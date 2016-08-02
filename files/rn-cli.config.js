var blacklist = require('react-native/packager/blacklist');

var config = {
  getBlacklistRE(platform) {
    return blacklist(platform, [
      process.env.PLATFORM !== 'osx' ? /node_modules\/react-native-desktop\/.*/ : /node_modules\/react-native\/.*/
    ]);
  }
};
                  
module.exports = config;

