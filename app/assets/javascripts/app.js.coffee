# AngularJS Inittiaze

# Include lib and plugin
window.app = angular.module('angularRailsSinglePageSample', [
  "ngCookies"
  "ngResource"
  "ngSanitize"
  "ui.router"
  "ngMessages"
  'angularUtils.directives.dirPagination'
])

# CSRF token setting
app.config ($httpProvider, $urlRouterProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken
  $urlRouterProvider.otherwise("/sign_in");

# The coexistence of angularJS and turbolink
$(document).on 'page:load', ->
  $('[ng-app]').each ->
    module = $(this).attr('ng-app')
    angular.bootstrap(this, [module])

