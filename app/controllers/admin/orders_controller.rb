class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @total = 0
    @order = Order.find(params[:id])
    @customer = @order.customer
  end
  
  def update
       @order = Order.find(params[:id])
       @order_details = @order.order_details
    if @order.update(order_params)
       @order_details.update_all()
    end
       redirect_to admin_order_path(@order)
  end
  
  private

  def order_params
  params.require(:order).permit(:status)
  end
  
end
