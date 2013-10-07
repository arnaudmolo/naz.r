passport = require("passport")

module.exports =
  login: (req, res) ->
    if req.method is 'GET'
      return res.view message: 'coucou'
    passport.authenticate("local", (err, user, info) ->
      return res.send err  if (err) or (not user)
      req.logIn user, (err) ->
        res.send err  if err
        res.send message: "login successful"
    ) req, res

  logout: (req, res) ->
    req.logout()
    res.send "logout successful"

module.exports.blueprints =
  action: true
  rest: true
  shortcuts: true