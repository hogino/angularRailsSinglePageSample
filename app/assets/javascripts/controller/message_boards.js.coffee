# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

app.controller 'MessageBoardsCtrl',[
  '$scope'
  '$stateParams'
  'MessageBoardsApi'
  (
    $scope
    $stateParams
    MessageBoardsApi
  ) ->
    apiVersion = "v1"
    $scope.get = ->
      $scope.currentPage = 1;
      $scope.pageSize = 10;

      MessageBoardsApi.get({
        version: apiVersion
      }).$promise.then ((data) ->
        $scope.items = data.message_boards
        return
      ), (error) ->
        "error"
        return

    $scope.show = ->
      MessageBoardsApi.get({
        version: apiVersion
        id: $stateParams.id
      }).$promise.then ((data) ->
        $scope.item = data.message_board
        return
      ), (error) ->
        "error"
        return

    $scope.create = ->
      mb = new MessageBoardsApi
      mb.title = $scope.title
      mb.body = $scope.body
      mb.$save({
        version: apiVersion
      })

    $scope.put = ->
      MessageBoardsApi.update({
        id: $stateParams.id
        version: apiVersion
      }, $scope.item)

    $scope.delete = (id) ->
      MessageBoardsApi.destroy({
        id: id
        version: apiVersion
      })
      $scope.getList()
    return
]
