actions =
# Constants
INCR: 'INCR'
DECR: 'DECR'
RESET: 'RESET'

# Actions
incr: (dispatch, getState) -> dispatch type: actions.INCR
decr: (dispatch, getState) -> dispatch type: actions.DECR
rese: (dispatch, getState) -> dispatch type: actions.RESET
#value: (dispatch, getState) -> getState()

module.exports = actions
