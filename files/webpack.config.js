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
            path.resolve(__dirname, "./~/react-native-macos")
          ],
      },
      {
        loader: "babel-loader",
        test: /\.jsx?$/,
        exclude: [/all.js/, /node_modules/],
        query: {
          presets: ['es2015', 'stage-0', 'react'],
          plugins: ['add-module-exports'],
          cacheDirectory: true
        }
      },
      {
        loader: "json-loader",
        test: /\.json$/
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
