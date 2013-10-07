'use strict'

angular.module('dubatoApp', ['ngRoute'])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: ->
          'views/main.html'
        controller: 'MainCtrl'
      .otherwise
        redirectTo: '/'
  .run ->