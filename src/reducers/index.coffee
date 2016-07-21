{combineReducers} = require 'redux'

reducers = {}
skip = [
  'index'
  'validate'
  'posts'
]

req = require.context '.', yes, /\.(coffee)$/
for file in req.keys() #.filter (name) -> not re.test name
  reducer = file
    .replace /\.(coffee)$/, ''
    .replace /\.\//, ''
  continue if reducer in skip
  console.log "Reducer: #{reducer}"
  reducers[reducer] = req './' + reducer + '.coffee'

module.exports = combineReducers reducers
