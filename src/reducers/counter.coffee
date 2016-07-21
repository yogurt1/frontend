extend = require 'lodash/extend'

{
  INCR, DECR, RESET
} = require 'actions/counter'

initialState = 0

module.exports = (state = initialState, action) -> switch action.type
  when INCR then state + 1
  when DECR then state - 1
  when RESET then 0
  else state
