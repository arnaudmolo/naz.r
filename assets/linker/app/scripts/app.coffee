'use strict'

angular.module('dubatoApp', ['ngRoute'])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: ->
          'views/main.html'
        controller: 'MainCtrl'
      .when '/Post',
        templateUrl: 'views/Post.html',
        controller: 'PostCtrl'
      .otherwise
        redirectTo: '/'
  .run ($rootScope, $location)->
    console.log $location