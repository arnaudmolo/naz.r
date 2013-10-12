'use strict'

angular.module('dubatoApp')
  .controller 'PostCtrl', ($scope, $rootScope, $sce, Sails) ->

    $rootScope.actualize = $scope.actualize = ->
      Sails.post '/posts', limit: 5,  (res) ->
        $scope.posts = res
        angular.forEach $scope.posts, (post, key) ->
          post.content = $sce.trustAsHtml post.content

    $scope.actualize()