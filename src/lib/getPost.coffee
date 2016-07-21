#_xr = require 'xr'
#xr = _xr.default
json = 'application/json'

#module.exports = (id) ->
#  xhr = new XMLHttpRequest()
#  #xhr.onreadystatechange = -> if xhr.readyState is 4 and xhr.status is 200
#    #  post = JSON.parse xhr.responseText
#  xhr.open 'GET', "posts/#{id}", off
#  xhr.setRequestHeader 'Accept', json
#  xhr.setRequestHeader 'Content-Type', json
#  xhr.send()
#  JSON.parse xhr.responseText

post = null
#module.exports = (id) ->
  #res = xr.get '/posts/1'
  #data = res.then (data) =>
  #  post = data.response
  #  console.log post
  #  @post = post
module.exports = (id) ->
  res = fetch "/posts/#{id}"
  console.log res
