var config = require('./dev.config');

var jsxLoader = config.module.loaders.filter(function(loader) {
  return  /jsx/.test(loader.test);
})[0];
jsxLoader.loaders.unshift('react-hot-loader/webpack');

var scssLoader = config.module.loaders.filter(function(loader) {
  return /s?css/.test(loader.test);
})[0];
scssLoader.loader = 'style!css!sass!';

config.output.publicPath = 'http://localhost:8080/assets/'

config.entry.main.push(
  'webpack/hot/only-dev-server',
  'webpack-dev-server/client?http://localhost:8080'
)

config.entry.main.unshift('react-hot-loader/patch')

module.exports = config;
