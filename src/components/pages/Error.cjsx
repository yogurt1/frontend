{Component} = React = require 'react'
error = require 'styles/pages/error'

module.exports = class Error extends Component
  render: -> <div>
  <h1 className={error.heading}>Not found</h1>
  <h2>Sorry</h2>
  </div>
