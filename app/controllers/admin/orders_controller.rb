class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @total = 0
    @order = Order.find(params[:id])
    @customer = @order.customer
  end
  
  def update
  end

end
