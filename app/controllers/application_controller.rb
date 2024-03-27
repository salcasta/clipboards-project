class ApplicationController < ActionController::Base
  skip_forgery_protection
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:general_manager_name, :logo, :organization_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:general_manager_name, :logo, :organization_name])
  end

end
