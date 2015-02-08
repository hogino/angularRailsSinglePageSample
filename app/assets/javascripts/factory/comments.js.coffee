app.factory 'CommentsApi', [
  '$resource'
  ($resource) ->
    $resource('/api/:version/message_boards/:message_board_id/comments/:id', null,{
      'destroy': method: 'DELETE'
    })
]