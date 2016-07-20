{Router, Route, IndexRoute} = require 'react-router'
Index = require 'components'
Error = require 'components/pages/Error'
About = require 'components/pages/About'
Home = require 'components/pages/Home'
#Posts = require 'components/pages/Posts'


module.exports =
<Router>
  <Route path='/' component={Index}>
    <IndexRoute component={Home} />
    <Route path='about' component={About} />
    {#<Route path='posts' component={Posts} />}
    <Route path='*' component={Error} />
  </Route>
</Router>
