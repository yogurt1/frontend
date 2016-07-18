{PropTypes, Component} = React = require 'react'

module.exports = class File extends Component
  @propTypes:
    file: PropType.string.isRequired
  handleChange: ->
    file = @files[0]
    swtich type
      when 'img' then new Image()
      when 'txt' then new File()
  render: ->
    {file} = @props
