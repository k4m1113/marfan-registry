const Webpack = require('webpack');
const WebpackNotifierPlugin = require('webpack-notifier');
const config = require('./../webpack.config');

config.plugins.push(new WebpackNotifierPlugin());
config.devtool = 'eval-source-map';

config.plugins.push(
  new Webpack.DefinePlugin({'process.env': {'NODE_ENV': '"development"'}})
);

module.exports = config;
