'use strict'

describe 'Controller: D3Ctrl', () ->

  # load the controller's module
  beforeEach module 'dubatoApp'

  D3Ctrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    D3Ctrl = $controller 'D3Ctrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3
