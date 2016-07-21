{createStore, combineReducers, applyMiddleware, compose} = require 'redux'
reducers = require 'reducers'

middlewares = [
  require('redux-thunk').default
].concat if production then [] else [
  require('redux-logger')(level: 'info', collapsed: yes)
  #window.devToolsExtension()
]

initialState = undefined
store = createStore reducers, initialState, applyMiddleware middlewares...
  #if middlewares[0]? then applyMiddleware middlewares
  #else undefined

#store.dispatch type: 'GET_POST_REQUEST', id: 1

if module.hot
  nextReducer = require 'reducers'
  module.hot.accept 'reducers', -> store.replaceReducer nextReducer

module.exports = store
