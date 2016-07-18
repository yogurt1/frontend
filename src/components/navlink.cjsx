{Component} = React = require 'react'
{Link} = require 'react-router'
{Button} = require 'react-bootstrap'

{link} = require 'styles/menu'

module.exports = class NavLink extends Component
  render: ->
    {to, children} = @props
    <li className={link}>
      <Link to={to}>{children}</Link>
    </li>
