var LocalStrategy, passport;

passport = require('passport');

LocalStrategy = require('passport-local').Strategy;

module.exports = {
  express: {
    customMiddleware: function(app) {
      app.use(passport.initialize());
      return app.use(passport.session());
    }
  }
};
