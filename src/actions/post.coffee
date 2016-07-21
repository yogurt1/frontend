actions =
# Constants
#ADD_POST: 'ADD_POST'
#GET_POST: 'GET_POST'
#EDIT_POST: 'EDIT_POST'
#REMOVE_POST: 'REMOVE_POST'
GET_POST_REQUEST: 'GET_POST_REQUEST'
GET_POST_SUCCESS: 'GET_POST_SUCCESS'
GET_POST_FAILURE: 'GET_POST_FAILURE'

# Actions
getPost: (id) -> (dispatch, getState) ->
  # {posts} = getState()
  #if posts[id]? then return

  dispatch type: 'GET_POST_REQUEST'
  #dispatch {type: GET_POST, id}

  fetch "/posts/#{id}"
    .then (res) ->
      if not res.ok then throw Error res.statusText
      else res
    .then (res) ->
      res.json()
    .then (json) ->
      dispatch type: actions.GET_POST_SUCCESS, post: json
    .then null, (err) ->
      dispatch type: actions.GET_POST_FAILURE, errors: err

module.exports = actions
