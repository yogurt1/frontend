# coffeelint: disable=max_line_length
webpack = require 'webpack'
{join, resolve} = require 'path'
{extend} = require 'underscore'
fs = require 'fs'

publicPath = 'http://localhost/~bsdfun/guestbook/web/'

#merge = require 'webpack-merge'
ExtractTextPlugin = require 'extract-text-webpack-plugin'
ProgressBarPlugin = require 'progress-bar-webpack-plugin'

styles =
  plugin: new ExtractTextPlugin 'styles.css', allChunks: on
  extract: (loader) -> if production then @plugin.extract('style', loader) else "style!#{loader}"
  common: 'css?sourceMap&importLoaders=1'
  sass: @common + '&modules' + '!postcss!sass?sourceMap'
  ref: @common + '!postcss!sass-loader-once?sourceMap'
  css: @common + '&modules!postcss'

{NODE_ENV} = process.env
production = NODE_ENV is 'production'

# Plugins
plugins =
  common: [
    #    new ProgressBarPlugin()
    new webpack.DefinePlugin
      "process.env.NODE_ENV": JSON.stringify NODE_ENV
      "production": JSON.stringify production
      "__DEV__": JSON.stringify production
  ]
  development: [
    new webpack.NoErrorsPlugin()
    new webpack.HotModuleReplacementPlugin()
  ]
  production: [
    new webpack.optimize.DedupePlugin(),
    new webpack.optimize.AggressiveMergingPlugin(),
    #new webpack.optimize.OccurenceOrderPlugin(),
    new webpack.optimize.UglifyJsPlugin
      compress: warnings: off
      mangle: on
      screw_ie8: on
  ]
  devserver: [
    #"webpack-dev-server/client?http://localhost:8080"
    #"webpack/hot/only-dev-server"
    #"webpack-hot-middleware/client"
    #"babel-polyfill"
  ]
  postcss: [
    require('autoprefixer')(['last 2 versions'])
    require 'postcss-svgo'
    require 'postcss-circle'
    require 'postcss-center'
    require 'postcss-animation'
    require 'postcss-triangle'
    require 'postcss-instagram'
    #require 'postcss-sprites'
    #require 'cssnano'
  ]
  expose: [{
    test: require.resolve 'react'
    loader: 'expose?React'
  },{
    test: require.resolve 'backbone'
    loader: 'expose?React'
  }]

reacthot = if production then [] else ['react-hot']

# Loaders
loaders = [{
  test: /\.(js|jsx)$/
  loaders: reacthot.concat ['babel-loader']
  include: resolve __dirname, './src'
  plugins: ['transform-runtime']
  query: presets: ['es2015', 'stage-0', 'react']
},{
  test: /\.cjsx$/
  loaders: reacthot.concat ['coffee', 'cjsx']
  exclude: /node_modules/
},{
  test: /\.coffee$/
  loader: 'coffee'
  exclude: /node_modules/
},{
  test: /\.cson$/
  loader: 'cson'
},{
  test: /\.(scss|sass)$/
  loader: styles.extract styles.common + styles.sass
},{
  test: /\.ref.(scss|sass)$/
  loader: styles.extract styles.common + styles.ref
},{
  test: /\.css$/
  loader: styles.extract styles.common + styles.css
},{
  test: /\.md$/
  loader: 'html!markdown'
},{
  test: /\.(png|jpg|ico|svg|woff(2))$/
  loader: 'url?limit=50000'
},{
  test: /\.(eot|ttf|woff(2))/
  loader: 'file?name=fonts/[name].[ext]'
}]

config =
  name: 'Guestbook'
  target: 'web'
  entry:
    bundle: ['./src/entry'].concat if not production then plugins.devserver else []
    #material: ['react-mdl/extra/material.js', 'react-mdl/extra/material.css']
  devtool: if production then 'source-map' else 'eval-source-map'
  devServer:
    hot: on
    inline: on
    stats: 'error-only'
    historyApiFallback: off
    proxy:
      '/post*': target: publicPath, secure: false
      '/site*': target: publicPath, secure: false
      '/fonts*': target: publicPath, secure: false
  debug: production
  postcss: -> plugins.postcss
  sassLoader:
    includePath: [resolve __dirname, './node_modules']
    #importer: importonce
  output:
    path: if production then join __dirname, '../web' else ''
    publicPath: if production then publicPath else '' 
    filename: '[name].js'
    libraryTarget: "umd"
  cache: on
  query: cache: on
  resolve:
    extensions: ['', '.js', '.cjsx', '.coffee', '.cson', '.sass', '.css']
    alias: extend {
      'components': resolve './src/components/'
      'styles': resolve './src/styles'
      'lib': resolve './src/lib'
      'reducers': resolve './src/reducers'
      'actions': resolve './src/actions'
    }, if production then {
      'react': 'react-lite'
      'react-dom': 'react-lite'
    }
  #resolveLoader: modulesDirectories: ['node_modules']
  module: loaders: loaders.concat if production then plugins.expose else []
    #.concat plugins.expose if not production
  plugins: [
    plugins.common...
    styles.plugin
    #html
    #new webpack.optimize.CommonsChunkPlugin
    # name: 'vendor'
    # filename: 'vendor.js'
    plugins[if production then 'production' else 'development']...
  ]

module.exports = config
