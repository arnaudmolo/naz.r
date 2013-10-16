'use strict'

angular.module('dubatoApp', ['ngRoute'])
  .config(['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
    $locationProvider.hashPrefix '!'
    $routeProvider
      .when '/',
        templateUrl: ->
          'views/main.html'
        controller: 'MainCtrl'
      .when '/Posts',
        templateUrl: 'views/Post.html',
        controller: 'PostCtrl'
      .when '/d3',
        templateUrl: 'views/d3.html',
        controller: 'D3Ctrl'
      .otherwise
        redirectTo: '/'
  ]).run ($rootScope, $location)->
    console.log $location