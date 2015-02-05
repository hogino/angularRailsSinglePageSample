# AngularJS Inittiaze

# Include lib and plugin
window.app = angular.module('angularRailsSinglePageSample', [
  "ngCookies"
  "ngResource"
  "ngSanitize"
  "ngRoute"
  "ngMessages"
  'angularUtils.directives.dirPagination'
])

# CSRF token setting
app.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

# The coexistence of angularJS and turbolink
$(document).on 'page:load', ->
  $('[ng-app]').each ->
    module = $(this).attr('ng-app')
    angular.bootstrap(this, [module])
