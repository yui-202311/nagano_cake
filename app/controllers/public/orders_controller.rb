class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
     @orders = current_customer.orders.all
  end

  def complete
  end

  def create
  end

  def index
    @orders = Order.all
  end

  def show
  end
end
