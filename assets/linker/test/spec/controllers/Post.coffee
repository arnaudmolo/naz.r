'use strict'

describe 'Controller: PostCtrl', () ->

  # load the controller's module
  beforeEach module 'dubatoApp'

  PostCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    PostCtrl = $controller 'PostCtrl', {
      $scope: scope
    }

  it 'should be true', () ->
    expect(true).toBe true