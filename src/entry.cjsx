#React = require 'react'
{render} = require 'react-dom'
{Router, hashHistory} = require 'react-router'
{Provider} = require 'react-redux'

store = require './store'
routes = require './routes'

app =
  <Provider store={store}>
    <Router routes={routes} history={hashHistory}/>
  </Provider>

render app, document.querySelector '#root'

if production then do require('offline-plugin/runtime').install
