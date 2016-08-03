var path = require('path');

module.exports = {
  module: {
    loaders: [
      {
        loaders: [],
        exclude: [
            path.resolve(__dirname, "./~/react"),
            path.resolve(__dirname, "./~/react-native"),
            path.resolve(__dirname, "./~/react-native-web"),
            path.resolve(__dirname, "./~/react-native-desktop")
          ],
      },
      {
        loader: "babel-loader",
        test: /\.jsx?$/,
        exclude: /all.js/,
        query: {
          presets: ['es2015', 'stage-0', 'react'],
          plugins: ['add-module-exports'],
          cacheDirectory: true
        }
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
