app.factory 'UsersApi', [
  '$resource'
  ($resource) ->
    $resource('/users/:id:format', null,{
      'update': method: 'PUT'
      'delete': method: 'DELETE'
      'signIn': method: 'post', url: '/users/sign_in'
    })
]