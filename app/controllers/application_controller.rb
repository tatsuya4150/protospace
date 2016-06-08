class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:name, :avatar, :member, :profile, :works)
    devise_parameter_sanitizer.for(:account_update).push(:name, :avatar, :member, :profile, :works)
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end
end
