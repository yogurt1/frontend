#React = require 'react'
{render} = require 'react-dom'
{Router, hashHistory} = require 'react-router'
{Provider} = require 'react-redux'

store = require './store'
routes = require './routes'

#onUpdate = -> store.dispatch routerStateChange @state

app =
  <Provider store={store}>
    <Router routes={routes} history={hashHistory}/>
  </Provider>

render app, document.querySelector '#root'

do require('offline-plugin/runtime').install
