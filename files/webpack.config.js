var path = require('path');

module.exports = {
  module: {
    loaders: [
      {
        loaders: [],
        exclude: [
            path.resolve(__dirname, "./~/react"),
            path.resolve(__dirname, "./~/react-native"),
            path.resolve(__dirname, "./~/react-native-web")
          ],
      }
    ]
  },
  entry: './index.web.js',
  output: {
    filename: '../dist/bundle.js'
  },
  resolve: {
    alias: {
      'react-native': 'react-native-web'
    }
  }
}
