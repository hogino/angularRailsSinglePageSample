# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# https://github.com/lynndylanhurley/ng-token-auth

app.controller 'UsersCtrl',[
  '$scope'
  '$auth'
  '$rootScope'
  '$state'
  (
    $scope
    $auth
    $rootScope
    $state
  ) ->
    ###################################
    # account registration
    ###################################
    $scope.handleRegBtnClick = ->
      $auth.submitRegistration($scope.registrationForm)
      .then((resp) ->
        # handle success response
      )
      .catch((resp) ->
        # handle error response
      )

    $scope.$on('auth:registration-email-success', (ev, message) ->
      alert("A registration email was sent to " + message.email)
    )

    $scope.$on('auth:registration-email-error', (ev, reason) ->
      alert("Registration failed: " + reason.errors[0])
    )

    $scope.$on('auth:email-confirmation-success', (ev, user) ->
      alert("Welcome, "+user.email+". Your account has been verified.")
    )

    $scope.$on('auth:email-confirmation-error', (ev, reason) ->
      alert("There was an error with your registration.")
    )

    ###################################
    # login event
    ###################################
    $scope.handleLoginBtnClick = ->
      $auth.submitLogin($scope.loginForm)
      .then((resp) ->
        # handle success response
      )
      .catch((resp) ->
        # handle error response
      )

    $rootScope.$on('auth:login-success', (ev, user) ->
      alert('Welcome ' + user.email)
      return
    )

    $rootScope.$on('auth:login-error', (ev, reason) ->
      alert('auth failed because ' + reason.errors[0])
    )

    ###################################
    # sign out
    ###################################
    $scope.handleSignOutBtnClick = ->
      $auth.signOut()
      .then((resp) ->
        # handle success response
      )
      .catch((resp) ->
        # handle error response
      )
    $rootScope.$on('auth:logout-success', (ev) ->
      alert('goodbye')
    )

    $rootScope.$on('auth:logout-error', (ev, reason) ->
      alert('logout failed because ' + reason.errors[0])
    )

    ###################################
    # password reset
    ###################################
    $scope.handlePwdResetBtnClick = ->
      $auth.requestPasswordReset($scope.pwdResetForm)
      .then((resp) ->
        # handle success response
      )
      .catch((resp) ->
        # handle error response
      )
    $scope.$on('auth:password-reset-request-success', (ev, data) ->
      alert("Password reset instructions were sent to " + data.email)
    )

    $scope.$on('auth:password-reset-request-error', (ev, resp) ->
      alert("Password reset request failed: " + resp.errors[0])
    )

    $rootScope.$on('auth:password-reset-confirm-success', ->
      $state.go('usersPwdReset');
    )

    $scope.$on('auth:password-reset-confirm-error', (ev, reason) ->
      alert("Unable to verify your account. Please try again.")
    )

    ###################################
    # password update
    ###################################
    $scope.handleUpdatePasswordBtnClick = ->
      $auth.updatePassword($scope.updatePasswordForm)
      .then((resp) ->
        # handle success response
      )
      .catch((resp) ->
        # handle error response
      )

    $scope.$on('auth:password-change-success', (ev) ->
      alert("Your password has been successfully updated!")
    )

    $scope.$on('auth:password-change-error', (ev, reason) ->
      alert("Registration failed: " + reason.errors[0])
    )

    ###################################
    # account update
    ###################################
    $scope.handleUpdateAccountBtnClick = ->
      $auth.updateAccount($scope.updateAccountForm)
      .then((resp) ->
        # handle success response
      )
      .catch((resp) ->
        # handle error response
      )

    $scope.$on('auth:account-update-success', (ev) ->
      alert("Your account has been successfully updated!")
    )

    $scope.$on('auth:account-update-error', (ev, reason) ->
      alert("Registration failed: " + reason.errors[0])
    )

    ###################################
    # account destroy
    ###################################
    $scope.handleDestroyAccountBtnClick = ->
      $auth.destroyAccount()
      .then((resp) ->
        # handle success response
      )
      .catch((resp) ->
        # handle error response
      )

    $scope.$on('auth:account-destroy-success', (ev) ->
      alert("Your account has been successfully destroyed!")
    )

    $scope.$on('auth:account-destroy-error', (ev, reason) ->
      alert("Account deletion failed: " + reason.errors[0])
    )
]