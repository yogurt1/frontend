{createStore, combineReducers, applyMiddleware} = require 'redux'
thunk = require 'redux-thunk'
createLogger = require 'redux-logger'
reducers = require 'reducers'

_devtools = window.devToolsExtension and window.devToolsExtension()
initialState = switch production
  when not true then _devtools
  else {}

store = createStore reducers, initialState, if not production
  applyMiddleware createLogger
    level: 'info', collapsed: true

store.dispatch type: 'INCR'
store.dispatch type: 'INCR'

if module.hot
  nextReducer = require 'reducers'
  module.hot.accept 'reducers', -> store.replaceReducer nextReducer

module.exports = store
