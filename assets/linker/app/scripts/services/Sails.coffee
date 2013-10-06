'use strict'

angular.module('dubatoApp')
  .provider 'Sails', () ->
    socket = io.connect()
    console.log "initialisation de socket"
      # Method for instantiating
    this.$get = ($rootScope) ->
      console.log "je sais pas"
      {
        on: (event, cb) ->
          socket.on event, ->
            args = arguments
            $rootScope.$apply ->
              cb.apply socket, args
        get: (url, cb) ->
          socket.get url, ->
            args = arguments
            $rootScope.$apply ->
              cb.apply socket, args
        post: (url, data, cb) ->
          socket.post url, data, ->
            args = arguments
            $rootScope.$apply ->
              cb.apply socket, args
        put: (url, data, cb) ->
          socket.put url, data, ->
            args = arguments
            $rootScope.$apply ->
              cb.apply socket, args
        delete: (url, data, cb) ->
          socket.delete url, data, ->
            args = arguments
            $rootScope.$apply ->
              cb.apply socket, args
      }
