var blacklist = require('react-native/packager/blacklist');

var config = {
  getBlacklistRE(platform) {
    return blacklist(platform, [
      /node_modules\/react-native-desktop\/.*/
    ]);
  }
};
                  
module.exports = config;