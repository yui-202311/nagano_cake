# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]
before_action :customer_state, only: [:create]

def after_sign_in_path_for(resource)
  case resource
  when Admin
    top_path
  when Customer
    root_path
  else
    root_path
  end
end

private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :email])
  end
  
  def customer_state
    customer = Customer.find_by(email: params[:customer][:email])
    return if customer.nil?
    return unless customer.valid_password?(params[:customer][:password])
    return if customer.is_active
    if !customer.is_active
    redirect_to new_customer_registration_path
    end
  end
  

# before_action customer_state if: :is_active
# @customer = current.user

# private
# def customer_state
#   if @customer.is_active == true
#   customer = Customer.find_by(email: params[:customer][:email])
#   elsif @customer.is_active :false
#     redirect_to action: 'create'
#   return if customer.nil?
#   @customer.password = params[:password]
#   return unless customer.valid_password?(params[:customer][:password])
#   redirect_to sign_up_path
#   end
# end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
