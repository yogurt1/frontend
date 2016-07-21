# {status, parse, catchErr} = require 'lib/fetchCommon'

json = 'application/json'
#move to XHR

module.exports = (id) ->
  xhr = new XMLHttpRequest()
  #xhr.onreadystatechange = -> if xhr.readyState is 4 and xhr.status is 200
    #  post = JSON.parse xhr.responseText
  xhr.open 'GET', "posts/#{id}", off
  xhr.setRequestHeader 'Accept', json
  xhr.setRequestHeader 'Content-Type', json
  xhr.send()
  #if xhr.status isnt 200 then throw new Error "#{xhr.status} #{xhr.statusText}"
  JSON.parse xhr.responseText
