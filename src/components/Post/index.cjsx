{PropTypes, Component} = React
{wrap, from, text} = require 'styles/blocks/post'
#File = require 'components/File'

module.exports = class Post extends Component
  #@propTypes:
    #post: PropTypes.object.isRequired
    #user: PropTypes.string.isRequired
    #email: PropTypes.string.isRequired
    #body: PropTypes.string.isRequired

  render: ->
    {user, email, body} = @props.data
    <div className={wrap}>
      <span className={from}>{user} <{email}></span>
      <p className={text}>{body}</p>
    </div>
