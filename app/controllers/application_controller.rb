class ApplicationController < ActionController::Base
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
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

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
