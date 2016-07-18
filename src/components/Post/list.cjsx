{PropTypes} = React = require 'react'
Post = require './post'

PostList = (posts, onPostClick = {}) -> <main>
  for post in posts
    <Post id={post.id} post={post} onClick={onPostClick post.id} />
</main>

PostList.propTypes =
  posts: PropTypes.arrayOf PropTypes.shape
    id: PropTypes.number.isRequired
    name: PropTypes.string.isRequired
    email: PropTypes.string.isRequired
    body: PropTypes.string.isRequired
