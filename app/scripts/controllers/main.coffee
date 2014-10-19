'use strict'

MainCtrl = ($scope, $rootScope, $location) ->
  $scope.showMain = true
  $scope.books = ["Genesis", "Exodus", "Deutronomy"]
  $scope.verses = _.filter BIBLE, (obj)-> obj.book is "Genesis"

  $scope.toggleBooks = ->
    $scope.showMain = !($scope.showMain)

  $scope.showBook = (book)->
    $scope.showMain = true
    $scope.verses = _.filter BIBLE, (obj)-> obj.book is book

MainCtrl.$inject = ["$scope", "$rootScope", "$location"]
angular.module("simpleCenturyBibleApp").controller "MainCtrl", MainCtrl
