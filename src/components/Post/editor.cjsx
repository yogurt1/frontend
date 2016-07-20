{Component} = React
{editor} = require 'styles/blocks/post'

module.exports = class Editor extends Component
  render: ->
    placeholder = "Type here..."
    
    <section className={editor}>
      <h3 className={heading}>Post editor</h3>
      <textarea className={input} placeholder={placeholder} />
    </section>
