app.factory 'UsersApi', [
  '$resource'
  ($resource) ->
    $resource('/users/:id:format', null,{
      'update': method: 'PUT'
      'delete': method: 'DELETE'
    })
]