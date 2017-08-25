/* eslint comma-dangle: ["error",
 {"functions": "never", "arrays": "only-multiline", "objects":
 "only-multiline"} ] */

const fs = require('fs');
const webpack = require("webpack");
const ExtractTextPlugin = require("extract-text-webpack-plugin");
const Dotenv = require("dotenv-webpack")
var path = require("path");
var node_dir = path.join(__dirname, '/node_modules');
var bower_dir = path.join(__dirname, '/bower_components');
const prod = process.argv.indexOf('-p') !== -1;
const css_output_template = prod ? "stylesheets/[name]-[hash].css" : "stylesheets/[name].css";
const js_output_template = prod ? "javascripts/[name]-[hash].js" : "javascripts/[name].js";
require('lodash')


module.exports = {
  context: path.join(__dirname, '..', 'app'),

  entry: {
    application: ['jquery', "./javascript/packs/application.js", "./stylesheet/application.scss", 'bootstrap-loader']
  },

  resolve: {
    alias: {
      'add-keyboard': path.resolve(
        './javascript/addKeyboard.js'
      ),
      "lodash$": "lodash/lodash.min"
    },
    modules: [
      "bower_components",
      "node_modules"
    ],
    descriptionFiles: [
      'bower.json',
      'package.json'
    ],
    extensions: ['.js', '.jsx', '.erb', '.css', '.scss', '.woff2', '.svg', '.tff', '.eot', '.jsx.erb', '.html'],
  },

  output: {
    path: path.join(__dirname, '..', 'public'),
    filename: js_output_template,
  },

  module: {
    loaders: [
      {
        test: /\.erb$/,
        enforce: 'pre',
        loader: 'rails-erb-loader'
      },
      {
        test: /\.jsx.erb$/,
        enforce: 'pre',
        loader: 'rails-erb-loader'
      },
      {
        test: /\.(js|jsx)$/,
        exclude: /node_modules/,
        loader: 'babel-loader',
        query: {
          presets: ['es2015', 'react']
        }
      },
      {
        test: /\.scss$/,
        use: ExtractTextPlugin.extract({
          fallback: 'style-loader',
          use: ['css-loader', 'sass-loader']
        })
      },
      {
        test: /\.html$/,
        loader: 'html-loader'
      },
      {
        test: /\.(woff2?|svg)$/,
        loader: 'url-loader?limit=10000&name=/fonts/[name].[ext]'
      },
      {
        test: /\.(ttf|eot)$/,
        loader: 'file-loader?name=/fonts/[name].[ext]'
      },
      {
        test: /bootstrap-sass\/assets\/javascripts\//,
        loader: 'imports-loader?jQuery=jquery'
      },
      {
        test: require.resolve('jquery'),
        use: [
          {
            loader: 'expose-loader',
            query: 'jQuery'
          },
          {
            loader: 'expose-loader',
            query: '$'
          }
        ]
      },
      {
        test: /jquery-plugin/,
        loader: 'imports?jQuery=jquery,$=jquery,this=>window'
      }
    ]
  },

  plugins: [
    new webpack.ProvidePlugin({
      $: "jquery",
      jQuery: "jquery",
      jquery: "jquery",
      "window.jQuery": "jquery",
      "window.Tether": 'tether',
      Tether: 'tether',
      tether: 'tether'
      // ADD epicMeds, etc?
    }),
    new ExtractTextPlugin({
      disable: false,
      filename: css_output_template,
      allChunks: true
    }),

    function() {
      // delete previous outputs
      this.plugin("compile", function() {
        let basepath = path.join(__dirname, "/public");
        let paths = ["/javascripts", "/stylesheets"];

        for (let x = 0; x < paths.length; x++) {
          const asset_path = basepath + paths[x];

          fs.readdir(asset_path, function(err, files) {
            if (files === undefined) {
              return;
            }

            for (let i = 0; i < files.length; i++) {
              fs.unlinkSync(asset_path + "/" + files[i]);
            }
          });
        }
      });

      // output the fingerprint
      this.plugin("done", function(stats) {
        let output = "ASSET_FINGERPRINT = \"" + stats.hash + "\""
        fs.writeFileSync(path.join(__dirname, '..', "config/initializers/fingerprint.rb"), output, "utf8");
      });
    }
  ]
};
