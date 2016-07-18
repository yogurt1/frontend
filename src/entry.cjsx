React = require 'react'
{render} = require 'react-dom'
{Router, hashHistory} = require 'react-router'
{Provider} = require 'react-redux'

styles = require 'styles/global' #prepend global styles
store = require './store'
routes = require './routes'

#onUpdate = -> store.dispatch routerStateChange @state

app =
  <Provider store={store}>
    <Router routes={routes} history={hashHistory}/>
  </Provider>

render app, document.querySelector '#root'
