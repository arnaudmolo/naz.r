passport = require("passport")

module.exports =
  login: (req, res) ->
    passport.authenticate("local", (err, user, info) ->
      return res.send {message: "login failed"}  if (err) or (not user)
      req.logIn user, (err) ->
        return res.send {message: "login failed"}  if err
        res.send message: "login successful"
    ) req, res

  logout: (req, res) ->
    req.logout()
    res.send "logout successful"

  logged: (req, res) ->
    if req.session.passport.user
      return res.json true
    return res.json false

module.exports.blueprints =
  action: true
  rest: true
  shortcuts: true