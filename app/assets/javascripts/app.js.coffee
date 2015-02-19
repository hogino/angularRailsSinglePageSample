# AngularJS Inittiaze

# Include lib and plugin
window.app = angular.module('angularRailsSinglePageSample', [
  "ngCookies"
  "ngResource"
  "ngSanitize"
  "ui.router"
  "ngMessages"
  "angularUtils.directives.dirPagination"
  "ng-token-auth"
])

# CSRF token setting
app.config ($httpProvider, $urlRouterProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken
  $urlRouterProvider.otherwise("/sign_in");

app.config ($authProvider) ->
  $authProvider.configure
    apiUrl: '/api'
    tokenValidationPath: '/auth/validate_token'
    signOutUrl: '/auth/sign_out'
    emailRegistrationPath: '/auth'
    accountUpdatePath: '/auth'
    accountDeletePath: '/auth'
    confirmationSuccessUrl: window.location.href
    passwordResetPath: '/auth/password'
    passwordUpdatePath: '/auth/password'
    passwordResetSuccessUrl: window.location.href
    emailSignInPath: '/auth/sign_in'
    storage: 'cookies'
    proxyIf: ->
      false
    proxyUrl: '/proxy'
    authProviderPaths:
      github: '/auth/github'
      facebook: '/auth/facebook'
      google: '/auth/google'
    tokenFormat:
      'access-token': '{{ token }}'
      'token-type': 'Bearer'
      'client': '{{ clientId }}'
      'expiry': '{{ expiry }}'
      'uid': '{{ uid }}'
    parseExpiry: (headers) ->
      # convert from UTC ruby (seconds) to UTC js (milliseconds)
      parseInt(headers['expiry']) * 1000 or null
    handleLoginResponse: (response) ->
      response.data
    handleAccountResponse: (response) ->
      response.data
    handleTokenValidationResponse: (response) ->
      response.data
  return

# The coexistence of angularJS and turbolink
$(document).on 'page:load', ->
  $('[ng-app]').each ->
    module = $(this).attr('ng-app')
    angular.bootstrap(this, [module])

