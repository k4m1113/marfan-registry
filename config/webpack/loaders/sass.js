const ExtractTextPlugin = require('extract-text-webpack-plugin')
const path = require('path')
const { env, settings } = require('../configuration.js')

const postcssConfigPath = path.resolve(process.cwd(), '.postcssrc.yml')
const isProduction = env.NODE_ENV === 'production'

const extractOptions = {
  fallback: 'style-loader',
  use: [
    { loader: 'css-loader', options: { minimize: isProduction } },
    { loader: 'postcss-loader', options: { sourceMap: true, config: { path: postcssConfigPath } } },
    'resolve-url-loader',
    { loader: 'sass-loader', options: { sourceMap: true, indentedSyntax: true } }
  ]
}
