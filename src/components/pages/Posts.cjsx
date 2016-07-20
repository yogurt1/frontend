{Component} = React = require 'react'
{NavLink} = require 'components/navlink'
Post = require 'components/Post'
getPost = require 'lib/getPost'

posts = for id in [1..3] then getPost id

module.exports = class Posts extends Component
  render: ->
    <div>
      <Post data={posts[0]} />
      <Post data={posts[1]} />
      <Post data={posts[2]} />
    </div>
