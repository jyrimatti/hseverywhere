var path = require('path');

module.exports = {
  module: {
    rules: [
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
        exclude: [/rts.js/,/out.js/,/lib.js/,/runmain.js/,/node_modules(?!\/react-native-(vector-icons|animatable))/],
        options: {
          presets: ['env', 'stage-0', 'react'],
          plugins: ['add-module-exports'],
          cacheDirectory: true
        }
      },
      {
        loader: "url-loader",
        test: /\.ttf$/
      },
    ]
  },
  entry: './index.web.js',
  output: {
    filename: "dist/bundle.js",
  },
  resolve: {
    alias: {
      'react-native': 'react-native-web'
    }
  }
}
