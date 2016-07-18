{Component} = React = require 'react'
{extend} = require 'underscore'

check = require 'lib/checkFile'
dtob = require 'lib/dtob'
getType = require 'lib/getType'
Image = require 'components/image'

module.exports = class FileInput extends Component
  constructor: (props) ->
    super props
    @state = {}
    @handleChange = @handleChange.bind this
    @handleSubmit = @handleSubmit.bind this

  handleSubmit: (ev) ->
    ev.preventDefault()
    console.log getType @state.url
    #console.log 'uploading: ' + dtob @state.url

  handleChange: (ev) ->
    ev.preventDefault
    file = ev.target.files[0]
    #console.log ev
    @state = check file
    reader = new FileReader()
    reader.onloadend = => @setState {file, url: reader.result}
    reader.onerror = => @setState msg: 'File reader error'
    if @state.image
      reader.readAsDataURL file
    else
      reader.readAsText file

  render: ->
    {image, allow, size, msg, url} = @state
    if not allow then preview = submit = ''
    else
      preview =
        if image then <Image
          src={url} width="320" height="240" />
        else  <p>{url}</p>
      submit =
        <button onClick={@handleSubmit}>Submit</button>

    <section>
      <label>Upload image: </label>
      <input
        name="file"
        type="file"
        ref="file"
        onChange={@handleChange} />
      {submit}
      <h3>Size: {size}</h3>
      <h3>{msg}</h3>
      {preview}
    </section>
