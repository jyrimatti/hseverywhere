var path = require('path');

module.exports = {
  mode: 'development',
  node: { process: false },
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
        exclude: [/all.js/,/rts.js/,/out.js/,/lib.js/,/runmain.js/,/node_modules(?!\/react-native-(vector-icons|animatable))/],
        options: {
          babelrc: false,
          presets: ['module:metro-react-native-babel-preset'],
          plugins: ['add-module-exports']
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
