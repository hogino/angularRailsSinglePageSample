class Users::RegistrationsController < Devise::RegistrationsController
  # exclude action :new to register directive
  prepend_before_filter :require_no_authentication, only: [ :create, :cancel ]
  prepend_before_filter :authenticate_scope!, :only => [:new, :create ,:edit, :update, :destroy]

  layout false

  def sign_up_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:email, :password, :password_confirmation)
    end
    super
  end
end