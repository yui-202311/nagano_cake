class ApplicationController < ActionController::Base
  before_action :authenticate_customer!, except: [:top]
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :is_active])
  end

  
end
