###
PostsController

@module      :: Controller
@description    :: A set of functions called `actions`.

Actions contain code telling Sails how to respond to a certain type of request.
(i.e. do stuff, then send some JSON, show an HTML page, or redirect to another URL)

You can configure the blueprint URLs which trigger these actions (`config/controllers.js`)
and/or override them with custom routes (`config/routes.js`)

NOTE: The code you write here supports both HTTP and Socket.io automatically.

@docs        :: http://sailsjs.org/#!documentation/controllers
###
module.exports =
  index: (req, res, next) ->
    Posts.find().done (err, posts) ->
      if req.isSocket
        console.log "et pas ca"
        return res.json posts
      console.log "La je renvoi bien la vue en mode pas JSON"
      return res.view posts: posts
  ###
  Overrides for the settings in `config/controllers.js`
  (specific to PostsController)
  ###
  _config: {}