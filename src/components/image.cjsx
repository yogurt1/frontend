{Component, createElement} = React = require 'react'
{extend} = require 'underscore'

module.exports = class Image extends Component
  constructor: (props) ->
    super props
    @state = status: null
    @handleLoad = @handleLoad.bind this
    @handleError = @handleError.bind this

  handleLoad: -> @setState status: 'loaded'
  handleError: -> @setState status: 'failed'
  render: ->
    {status} = @state
    <div>
    {createElement 'img', extend(@props,
      onLoad: @handleLoad, onError: @handleError)}
    {status}
    </div>
