class ApplicationController < ActionController::Base
  skip_forgery_protection
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    clipboards_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:general_manager_name, :organization_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:general_manager_name, :organization_name])
  end

end
