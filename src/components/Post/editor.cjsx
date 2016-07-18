{Component} = React = require 'react'
{editor} = require 'styles/post/editor'

module.exports = class Editor extends Component
  render: ->
    placeholder = "Type here..."
    
    <section className={editor}>
      <h3 className={heading}>Post editor</h3>
      <textarea className={input} placeholder={placeholder} />
    </section>
