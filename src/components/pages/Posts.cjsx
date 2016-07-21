{Component} = React = require 'react'
{Link} = require 'react-router'
{NavLink} = require 'components/navlink'
Post = require 'components/Post'
{connect} = require 'react-redux'
{getPost} = require 'actions/post'

#getPost = require 'lib/getPost'
#posts = for id in [1..3] then getPost id

class Posts extends Component
  componentDidMount: ->
    @props.dispatch getPost id for id in [1..3]

  #componentWillReceiveProps: ({id}) ->
  # if id isnt @props.id
  #   @props.dispatch getPost id

  render: ->
    {posts, isFetching, errors} = @props.post

    if posts?
      content =
      <div>{for post in posts
        <Post post={post} key={post.id} />}
      </div>
    if isFetching
      content = <h3>Loading posts...</h3>
    if error?
      content = <h3>Error: {error}</h3>
    #if not posts?
    #  content = <h3>Posts fetching failed :(</h3>

    <div>
      <a href="#/posts">
        <h1>Refresh</h1>
      </a>
      {content}
    </div>

#mapStateToProps = (state, ownProps) ->

module.exports = connect((state) -> state) Posts
