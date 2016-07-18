isMatch = (arg, str) ->
  str or= @
  re = arg
  re = (new RegExp arg) if typeof arg is 'string'
  re.test str

String::isMatch = isMatch
module.exports = isMatch
