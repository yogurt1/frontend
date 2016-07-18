{combineReducers} = require 'redux'

module.exports = combineReducers
  counter: require './counter'
  posts: require './posts'
