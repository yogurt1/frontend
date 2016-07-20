# {status, parse, catchErr} = require 'lib/fetchCommon'

json = 'application/json'
post = null
#move to XHR

module.exports = (id) ->
  xhr = new XMLHttpRequest()
  xhr.onreadystatechange = -> if xhr.readyState is 4 and xhr.status is 200
    post = JSON.parse xhr.responseText
  xhr.open 'GET', "posts/#{id}", yes
  xhr.setRequestHeader 'Accept', json
  xhr.setRequestHeader 'Content-Type', json
  xhr.send()
  #if xhr.status isnt 200 then throw new Error "#{xhr.status} #{xhr.statusText}"
  while post isnt null
    console.log post
    return post
