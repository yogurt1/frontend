{post, posts, status} = require 'actions'
{extend} = require 'underscore'
failure = require 'lib/failure'

{SUCCESS, FAILURE, REST} = status
{FETCH_POSTS, RESET_POSTS} = posts
{ FETCH_POST, RESET_ACTIVE_POST,
  CREATE_POST, RESET_NEW_POST,
  DELETE_POST, RESET_DELETED_POST
} = post

factory = (post = null, error = null, loading = false) ->
  {post, error, loading}

initialState =
  postsList: posts: [], error: null, loading: false
  newPost: factory()
  activePost: factory()
  deletedPost: factory()

max = (max, id) -> Math.max id, max

module.exports = (state = initialState, action) -> switch action.type
  when FETCH_POST + SUCCESS then factory action.payload.data
  else state
