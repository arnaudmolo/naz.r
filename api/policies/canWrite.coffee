module.export = canWrite = (req, res, next) ->
  postId = req.param 'id'
  userId = req.session.user.id

  Permission.findOneByPostId postId, (err, permission)->
    return next err if err
    return res.redirect '/notAllowed' if permission.type isnt 'write'
    next()