'use strict'

MainCtrl = ($scope, $rootScope, $location) ->
  firstBook = "Genesis"
  $scope.showMain = true
  $scope.books = _.uniq(_.pluck(BIBLE, 'book'))
  $scope.book = firstBook
  $scope.verses = _.filter BIBLE, (obj)-> obj.book is firstBook

  $scope.toggleBooks = ->
    $scope.showMain = !($scope.showMain)

  $scope.showBook = (book)->
    $scope.showMain = true
    $scope.book = book
    $scope.verses = _.filter BIBLE, (obj)-> obj.book is book

MainCtrl.$inject = ["$scope", "$rootScope", "$location"]
angular.module("simpleCenturyBibleApp").controller "MainCtrl", MainCtrl
