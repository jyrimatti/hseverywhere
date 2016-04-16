var blacklist = require('react-native-desktop/packager/blacklist');

var config = {
  getBlacklistRE(platform) {
    return blacklist(platform, [
      /node_modules\/react-native\/.*/
    ]);
  }
};
                  
module.exports = config;