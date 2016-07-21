{createStore, combineReducers, applyMiddleware, compose} = require 'redux'
reducers = require 'reducers'

middlewares = [
  require('redux-thunk').default
].concat if production then [] else [
  require('redux-logger')(level: 'info', collapsed: yes)
  #_devtools
]

_fallback = (f) -> f
initialState = undefined
store = createStore reducers, initialState, compose(
  applyMiddleware middlewares...,
  #window.devToolsExtension and window.devToolsExtension() or
  #_fallback
)

counterActions = require 'actions/counter'
store.dispatch counterActions.incr

if module.hot
  nextReducer = require 'reducers'
  module.hot.accept 'reducers', -> store.replaceReducer nextReducer

module.exports = store
