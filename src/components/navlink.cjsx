{Component} = React = require 'react'
{Link} = require 'react-router'

{link} = require 'styles/pages/index'

module.exports = class NavLink extends Component
  render: ->
    {to, children} = @props
    <li className={link}>
      <Link to={to}>{children}</Link>
    </li>
