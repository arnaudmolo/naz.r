'use strict'
console.log "chargement de main.coffee"
angular.module('dubatoApp')
  .controller 'MainCtrl', ($scope, Sails) ->
    console.log "ready"
    Sails.get '/', (res)->
      console.log res
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
