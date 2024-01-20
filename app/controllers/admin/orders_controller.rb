class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @customer = Customer.find(customer_params)
  end
  
  def customer_params
    params.require(:customer).permit(:email, :first_name, :last_name, :first_name_kana, :first_name_kana,
                                  :postal_code, :address, :telephone_number)
  end
end
