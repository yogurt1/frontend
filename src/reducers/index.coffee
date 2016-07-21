{combineReducers} = require 'redux'

reducers = {}
skip = [
  #'index'
  'validate'
]

req = require.context '.', yes, /\.(coffee)$/
for file in req.keys() #.filter (name) -> not re.test name
  reducer = file
    .replace /\.(coffee)$/, ''
    .replace /\.\//, ''
  unless reducer in skip
    reducers[reducer] = req './' + reducer + '.coffee'

module.exports = combineReducers reducers
