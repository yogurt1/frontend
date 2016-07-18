#Data URI to base64 string
module.exports = (str) ->
  re = /^data\:(\w+)\/(\w+)\;base64\,/
  str.replace re, ''
