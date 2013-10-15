'use strict'

angular.module('dubatoApp')
  .controller 'LoginCtrl', ($scope, $rootScope, $http, $location, $timeout) ->
    $http.get('/auth/logged').success (res) ->
      $rootScope.logged = res
      $scope.logFailed = {}
    $scope.login =  ($event) ->
      $http.post('/login', {username: $scope.username, password: $scope.password}).success (res) ->
        if res.message is 'login successful'
          $rootScope.logged = true
          $location.path '/Post'
          if typeof $rootScope.actualize is "function"
            $rootScope.actualize() 
        else 
          console.log 'else', res
          $scope.logFailedStatus = true
          $scope.logFailedMessage = res.message
          $timeout ->
            $scope.logFailedStatus = false
          , 1000
      $scope.username = ''
      $scope.password = ''