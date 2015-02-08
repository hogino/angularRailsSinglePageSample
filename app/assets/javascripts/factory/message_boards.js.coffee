app.factory 'MessageBoardsApi', [
  '$resource'
  ($resource) ->
    $resource('/api/:version/message_boards/:id', null,{
      'update': method: 'PUT'
      'destroy': method: 'DELETE'
    })
]