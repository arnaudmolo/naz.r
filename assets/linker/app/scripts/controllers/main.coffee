'use strict'

angular.module('dubatoApp')
  .controller 'MainCtrl', ($scope, $sce, Sails) ->
    Sails.post '/posts/find', limit: 5,  (res) ->
      $scope.posts = res
      angular.forEach $scope.posts, (post, key) ->
        post.content = $sce.trustAsHtml post.content