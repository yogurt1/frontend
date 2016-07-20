{createStore, combineReducers, applyMiddleware} = require 'redux'
reducers = require 'reducers'
initialState = counter: 0

middlewares = [
  #require 'redux-thunk'
].concat if production then [] else [
  require('redux-logger')(level: 'info', collapsed: yes)
]

store = createStore reducers, initialState, switch middlewares[0]
  when not undefined then applyMiddleware middlewares
  else undefined

store.dispatch type: 'INCR'
store.dispatch type: 'INCR'

if module.hot
  nextReducer = require 'reducers'
  module.hot.accept 'reducers', -> store.replaceReducer nextReducer

module.exports = store
