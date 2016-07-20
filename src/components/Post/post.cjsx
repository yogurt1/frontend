{PropTypes, Component} = React
{post} = require 'styles/blocks/post'
File = require 'components/File'


module.exports = class Post extends Component
  @propTypes:
    name: PropTypes.string.isRequired
    email: PropTypes.string.isRequired
    body: PropTypes.string.isRequired

  render: ->
    {name, email, body, file, created_at} = @props
    <section className={post}>
      <span>{name} <{email}></span>
      <p>{body}</p>
      <File className={file} file={file} />
    </section>
