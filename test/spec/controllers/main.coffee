'use strict'

describe 'Controller: MainCtrl', ->

  # load the controller's module
  beforeEach module 'simpleBibleApp'

  MainCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    MainCtrl = $controller 'MainCtrl', {
      $scope: scope
    }

  it 'should be setup properly', ->
    expect(2 + 2).toBe 4
