extend = require 'lodash/extend'

{
  GET_POST_REQUEST, GET_POST_SUCCESS, GET_POST_FAILURE
} = require 'actions/post'


initialState =
  posts: []
  isFetching: no
  error: null # failure when greater then 0

module.exports = (state = initialState, action) -> switch action.type
  when GET_POST_REQUEST then extend state,
    isFetching: yes
  when GET_POST_SUCCESS then extend state,
    isFetching: no, posts: [state.posts..., action.post], error: null
  when GET_POST_FAILURE then extend state,
    isFetching: no, errors: action.errors
  else state
