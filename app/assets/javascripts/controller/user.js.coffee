# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

app.controller 'UsersListCtrl',[
  '$scope'
  'ApiService'
  (
    $scope
    ApiService
  ) ->
    ApiService.getUsers().then (res) ->
      $scope.items = res.data
]

app.controller 'UsersShowCtrl',[
  '$scope'
  '$routeParams'
  'UsersApi'
  (
    $scope
    $routeParams
    UsersApi
  ) ->
    $scope.id = $routeParams.id
    $scope.item = UsersApi.get({
      id: $scope.id,
      format: '.json'
    })
]

app.controller 'UsersNewCtrl',[
  '$scope'
  '$routeParams'
  'UsersApi'
  (
    $scope
    $routeParams
    UsersApi
  ) ->
    $scope.submit = ->
      user = new UsersApi
      user.user = {
          name:$scope.name
        }
      user.$save()
]

app.controller 'UsersEditCtrl',[
  '$scope'
  '$routeParams'
  'UsersApi'
  (
    $scope
    $routeParams
    UsersApi
  ) ->
    $scope.id = $routeParams.id
    $scope.item = UsersApi.get({
      id: $scope.id,
      format: '.json'
    })

    $scope.submit = ->
      UsersApi.update({id: $scope.id}, $scope.item)
]

app.controller 'UsersDeleteCtrl',[
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
    $scope.id = $routeParams.id
    UsersApi.delete({id: $scope.id})

    ApiService.getUsers().then (res) ->
      $scope.items = res.data
]