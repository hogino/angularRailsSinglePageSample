class Users::SessionsController < Devise::SessionsController
  # exclude action :new to register directive
  prepend_before_filter :require_no_authentication, only: [ :create ]

  # layout false
end