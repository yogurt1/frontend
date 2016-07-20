{Component} = React

module.exports = class Captcha extends Component
  render: -> <form method="post" action="site/validate" role="form">
    <img src="site/captcha" />
    <label>Captcha: </label>
    <input type="text" name="captcha" />
    <button type="submit" name="submit">Submit</button>
  </form>
