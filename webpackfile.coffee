# coffeelint: disable=max_line_length
webpack = require 'webpack'
{join, resolve} = require 'path'
extend = require 'lodash/extend'
fs = require 'fs'

api = 'http://localhost/~bsdfun/guestbook/web/'
publicPath = ''

#merge = require 'webpack-merge'
ExtractTextPlugin = require 'extract-text-webpack-plugin'
#ProgressBarPlugin = require 'progress-bar-webpack-plugin'
HtmlPlugin = require 'html-webpack-plugin'
OfflinePlugin = require 'offline-plugin'

styles =
  plugin: new ExtractTextPlugin filename: 'static/styles.[chunkhash].css', allChunks: on
  extract: (loader) -> if production then @plugin.extract {dontExtractLoader: 'style', loader} else "style!#{loader}"
  common: 'css?minimize&sourceMap&importLoaders=1'
  sass: -> @common + '&modules' + '!postcss!sass?sourceMap'
  css: -> @common + '&modules!postcss'

{NODE_ENV} = process.env
production = NODE_ENV is 'production'

# Plugins
plugins =
  common: [
    new webpack.ProvidePlugin
      React: 'react'
      'window.React': 'react'

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
  prefetch: do -> new webpack.PrefetchPlugin module  for module in [
    'react', 'redux', 'react-router', 'react-dom', 'lodash'
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
    test: require.resolve 'redux'
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
  #loaders: reacthot.concat ['coffee', 'cjsx']
  loaders: ['coffee', 'cjsx']
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
  loader: styles.extract do styles.sass
},{
  test: /\.css$/
  loader: styles.extract do styles.css
},{
  test: /\.md$/
  loader: 'markdown'
  #},{
  #test: /\.(png|jpg|ico|svg|eot|ttf|woff(2))/
  #loader: 'file?name=static/[name].[hash].[ext]'
},{
  test: /\.(eot|ttf|woff(2))$/
  loader: 'url?limit=100000&name=static/[name].[hash].[ext]'
},{
  test: /\.(png|jpg|ico|svg)$/
  loader: 'url?limit=100000&name=statuc/[name].[hash].[ext]!image-webpack?optimizationLevel=9'
}]
  
config =
  name: 'Guestbook'
  target: 'web'
  entry:
    bundle: ['./src/entry'].concat if not production then plugins.devserver else []
    vendor: ['react', 'redux', 'react-router', 'react-redux', 'react-dom', 'redux-logger']
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
  output:
    path: resolve './dist'
    publicPath: if production then publicPath else ''
    filename: 'static/[name].[chunkhash].js'
    chunkFilename: 'static/[name].[chunkhash].js'
    sourcemapFilename: 'static/[name].map'
    sourceMapFilename: 'static/[name].map'
    libraryTarget: "umd"
  resolve:
    extensions: ['', '.js', '.cjsx', '.coffee', '.cson', '.sass', '.css']
    alias: extend {
      'components': resolve './src/components/'
      'styles': resolve './src/styles'
      'lib': resolve './src/lib'
      'reducers': resolve './src/reducers'
      'actions': resolve './src/actions'
      'images': resolve './src/assets/images'
      'fonts': resolve './src/assets/fonts'
    }, if production then {
      'react': 'react-lite'
      'react-dom': 'react-lite'
    }
  module: loaders: loaders.concat if not production then plugins.expose else []
  plugins: [
    plugins.common...
    plugins.prefetch...
    styles.plugin
    new OfflinePlugin
      AppCache:
        publicPath: ''
        directory: ''
    new webpack.optimize.CommonsChunkPlugin
      name: 'vendor'
      filename: 'static/[name].[chunkhash].js'
    new HtmlPlugin
      template: './src/assets/index.html.coffee'
      cache: yes
      hash: yes
    plugins[if production then 'production' else 'development']...
  ]

module.exports = config
