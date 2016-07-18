{Component} = React = require 'react'
Image = require 'components/image'

getType = require 'lib/getType'
{wrap, text, image} = require 'styles/attachment'

module.exports = class FileShow extends Component
  render: ->
  {file} = @props
  content = switch getType file
    when 'text'
      <text className={text}>{file}</text>
    when 'image'
      <Image className={image} src={file} />
  <div className={wrap}>{content}</div>
