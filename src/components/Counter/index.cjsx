{Component, PropTypes} = React = require 'react'
{connect} = require 'react-redux'
actions = require 'actions/counter'

class Counter extends Component
  #componentDidMount: ->
    #@props.dispatch INCR

  render: ->
    {incr, decr, reset, value} = actions
    {counter, dispatch} = @props
    console.log counter
    <div>
      <h1>Counter: {counter}</h1>
      <button onClick={dispatch incr}>Increment</button>
      <button onClick={dispatch decr}>Decrement</button>
      <button onClick={dispatch reset}>Reset</button>
    </div>

mapStateToProps = (state) -> state

module.exports = connect(mapStateToProps) Counter
