class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @total = 0
    @order = Order.find(params[:id])
    @customer = @order.customer
  end
  
  def update
  end
  
  private

  def customer_params
  params.require(:order).permit(:email, :first_name, :last_name, :first_name_kana, :first_name_kana,
                                  :postal_code, :address, :telephone_number, :status, :making_status)
  end

end
