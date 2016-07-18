# {status, parse, catchErr} = require 'lib/fetchCommon'

###module.exports = (id) ->
  data = ""
  fetch "posts/#{id}"
    #.then status
    .then parse
    .then (json) ->
      return data = json
    .catch catchErr
  data###

json = 'application/json'
#move to XHR
module.exports = (id) ->
  xhr = new XMLHttpRequest()
  xhr.open 'GET', "posts/#{id}", no
  xhr.setRequestHeader 'Accept', json
  xhr.setRequestHeader 'Content-Type', json
  xhr.send()
  if xhr.status isnt 200
    throw new Error "#{xhr.status} #{xhr.statusText}"
  else
    xhr.responseText
