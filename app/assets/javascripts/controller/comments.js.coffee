# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

app.controller 'CommentsCtrl',[
  '$scope'
  '$routeParams'
  'CommentsApi'
  'MessageBoardsApi'
  (
    $scope
    $routeParams
    CommentsApi
    MessageBoardsApi
  ) ->
    apiVersion = "v1"
    $scope.get = ->
      $scope.currentPage = 1;
      $scope.pageSize = 10;

      getMsgBoard()
      CommentsApi.get({
        message_board_id: $routeParams.message_board_id
        version: apiVersion
      }).$promise.then ((data) ->
        $scope.comments = data.comments
        return
      ), (error) ->
        "error"
        return

    getMsgBoard = ->
      MessageBoardsApi.get({
        version: apiVersion
        id: $routeParams.message_board_id
      }).$promise.then ((data) ->
        $scope.msgBoard = data.message_board
        return
      ), (error) ->
        "error"
        return

    $scope.create = ->
      mb = new CommentsApi
      mb.body = $scope.body
      mb.$save({
        message_board_id: $routeParams.message_board_id
        version: apiVersion
      })
      $scope.body = ''
      $scope.get()

    $scope.delete = (id) ->
      CommentsApi.destroy({
        message_board_id: $routeParams.message_board_id
        id: id
        version: apiVersion
      })
      $scope.get()

]
