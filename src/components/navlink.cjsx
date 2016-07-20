{Component} = React = require 'react'
{Link} = require 'react-router'

{link} = require 'styles/blocks/header'

module.exports = class NavLink extends Component
  render: ->
    {to, children} = @props
    <li className={link}>
      <Link to={to}>{children}</Link>
    </li>
