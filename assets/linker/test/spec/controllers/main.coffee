'use strict'

describe 'Controller: MainCtrl', () ->

  # load the controller's module
  beforeEach module 'dubatoApp'

  MainCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    MainCtrl = $controller 'MainCtrl', {
      $scope: scope
    }

  it 'should be true', (done) ->
    expect(true).toBe true