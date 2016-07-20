{Component} = React = require 'react'
{message} = require 'styles/pages/about'

module.exports = class About extends Component
  render: -> <div className={message}>
    <h1>React-router works!</h1>
  </div>
