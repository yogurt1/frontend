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
  #if posts[id-1]? then return

  dispatch type: actions.GET_POST_REQUEST

  _json = 'application/json'
  headers = new Headers
  headers.append 'Content-Type', _json
  headers.append 'Accept', _json

  fetch "posts/#{id}", {headers}
    .then (res) ->
      if not res.ok then throw Error res.statusText
      else res
    .then (res) ->
      res.json()
    .then (json) ->
      dispatch type: actions.GET_POST_SUCCESS, payload: json
    .then null, (err) ->
      dispatch type: actions.GET_POST_FAILURE, errors: err

module.exports = actions
