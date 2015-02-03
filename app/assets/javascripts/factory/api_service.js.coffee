app.factory 'ApiService',[
  '$http'
  ($http) ->
    getUsers: ->
      $http.get('/users.json').success((data) ->
          return data
        )
]