'use strict'

describe 'Directive: ghVisualization', () ->

  # load the directive's module
  beforeEach module 'dubatoApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<gh-visualization></gh-visualization>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the ghVisualization directive'
