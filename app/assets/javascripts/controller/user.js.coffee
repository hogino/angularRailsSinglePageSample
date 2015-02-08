# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

app.controller 'UsersCtrl',[
  '$scope'
  '$routeParams'
  'UsersApi'
  'ApiService'
  (
    $scope
    $routeParams
    UsersApi
    ApiService
  ) ->
    $scope.msgInfo = ''

    $scope.getList = ->
      $scope.currentPage = 1;
      $scope.pageSize = 10;

      ApiService.getUsers().then (res) ->
        $scope.items = res.data

    $scope.getUser = ->
      $scope.item = UsersApi.get({
        id: $routeParams.id,
        format: '.json'
      })

    $scope.createUser = ->
      request = new UsersApi
      request.user = {
        name:$scope.name
      }
      request.$save()
      $scope.msgInfo = 'Create!!!'



    $scope.updateUser = ->
      UsersApi.update({
        id: $routeParams.id,
        format: '.json'
      }, $scope.item)
      $scope.msgInfo = 'Update!!!'


    $scope.deleteUser = (id) ->
      UsersApi.delete({
        id: id,
        format: '.json'
      })
      $scope.msgInfo = 'Delete!!!'

]
