// based on:
// https://gist.githubusercontent.com/ndbroadbent/6261dbc0ed60e20a7f71e8987cf18aa7/raw/2e76e5321ae8331e662317f96930222fbbb6e308/rn-cli.config.js

const path = require('path');

const sharedBlacklist = ['react-native/local-cli/core/__fixtures__.*'];


const platformBlacklists = {
  mobile: [
    '.web.js',
    '.windows.js',
    '.macos.js',
    'node_modules/react-native-web/.*',
    'node_modules/react-native-windows/.*',
    'node_modules/react-native-macos/.*',
    'node_modules/[^/]+/.git/.*'
  ],
  web: [
    '.windows.js',
    '.macos.js',
    'node_modules/react-native-windows/.*',
    'node_modules/react-native-macos/.*',
    'node_modules/[^/]+/.git/.*'
  ],
  windows: [
    '.web.js',
    '.macos.js',
    'node_modules/react-native-web/.*',
    'node_modules/react-native/.*',
    'node_modules/react-native-macos/.*',
    'node_modules/[^/]+/.git/.*'
  ],
  macos: [
    '.web.js',
    '.windows.js',
    'node_modules/react-native-web/.*',
    'node_modules/react-native-windows/.*',
    'node_modules/[^/]+/.git/.*'
  ],
}

function blacklist(platform, additionalBlacklist) {
  // eslint-disable-next-line
  return new RegExp(
    (additionalBlacklist || []).concat(sharedBlacklist)
      .concat(platformBlacklists[platform] || [])
      .join('|'));
}

function bl() {
  if (process && (process.env.PLATFORM === 'macos' || process.argv.filter(a => a.indexOf('react-native-macos') > -1).length > 0)) {
    console.log("rn-cli.config.js: macos");
    return blacklist('macos');
  } else if (process && (process.env.PLATFORM === 'web' || process.argv.filter(a => a.indexOf('react-native-web') > -1).length > 0)) {
    console.log("rn-cli.config.js: web");
    return blacklist('web');
  }
  
  console.log("rn-cli.config.js: mobile");
  return blacklist('mobile');
}

module.exports = {
  resolver: {
    blacklistRE: bl()
  },
  server: {
    enableVisualizer: true
  },
  getBlacklistRE(platform) {
    return bl();
  }
}