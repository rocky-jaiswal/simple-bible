'use strict'

MainCtrl = ($scope, $rootScope, $location) ->
  $scope.page = 'books'
  $scope.books = _.uniq(_.pluck(BIBLE, 'book'))

  $scope.showBooks = ->
    $scope.page = 'books'

  $scope.showChapters = (book)->
    $scope.page = 'chapters'
    $scope.book = book
    verses = _.filter BIBLE, (obj)-> obj.book is book
    $scope.chapters = _.uniq(_.pluck(verses, 'chapter'))

  $scope.showVerses = (book, chapter)->
    $scope.page = 'verses'
    $scope.book = book
    $scope.chapter = chapter
    $scope.verses = _.filter BIBLE, (obj)-> obj.book is book and obj.chapter is chapter

MainCtrl.$inject = ["$scope", "$rootScope", "$location"]
angular.module("simpleBibleApp").controller "MainCtrl", MainCtrl
