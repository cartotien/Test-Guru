class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :hello_flash_message, only: :create, if: :devise_controller?
  before_action :authenticate_user!, except: :index

  private

  def after_sign_in_path_for(resource)
    admin? ? admin_tests_path : root_path
  end

  def admin?
    current_user.is_a? Admin
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end

  def hello_flash_message
    flash[:notice] = "Привет, #{current_user.first_name}!" if current_user
  end
end
