{PropTypes, Component} = React = require 'react'

textExport = (text) -> saveAs new Blob [text], type: 'text/plain;charser=UTF-8'
imageExport = (blob) ->
  type =
  saveAs new Blob [blob], {type}

save = (file, blob) -> switch type
  when 'text/plain' then saveAs new Blob [file], {type}
  else
    type = 

module.exports = class File extends Component
  @propTypes:
    file: PropType.string.isRequired
  handleChange: ->
    file = @files[0]

  render: ->
    {file} = @props
