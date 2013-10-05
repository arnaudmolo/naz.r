'use strict'

angular.module('dubatoApp', [])
  .config ($routeProvider) ->
    console.log "coucou"
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .otherwise
        redirectTo: '/'
