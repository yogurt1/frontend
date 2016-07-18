module.exports = (payload) ->
  {message, data} = payload
  data or {message}
