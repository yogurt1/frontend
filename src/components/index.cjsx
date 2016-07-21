{Component} = React = require 'react'
# {heading} = require './common'
{Link} = require 'react-router'
NavLink = require './navlink'

{nav, wrap} = require 'styles/pages/index' #+transition
space = ' '

module.exports = class Index extends Component
  render: -> <div>
  <header>
    <nav className={wrap}>
      <ul className={nav}>
        <NavLink to="/">Home</NavLink>
        <NavLink to="/about">About</NavLink>
        <NavLink to="/posts">Posts</NavLink>
        <NavLink to="/counter">Counter</NavLink>
      </ul>
    </nav>
  </header>
  {@props.children}
  </div>
