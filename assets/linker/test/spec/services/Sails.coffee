'use strict'

describe 'Service: Sails', () ->

  # load the service's module
  beforeEach module 'dubatoApp'

  # instantiate service
  Sails = {}
  beforeEach inject (_Sails_) ->
    Sails = _Sails_

  it 'should do something', () ->
    expect(!!Sails).toBe true
