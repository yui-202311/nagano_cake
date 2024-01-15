class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
      @order = Order.new(order_params)
    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name 
      @order.customer_id = current_customer
    elsif params[:order][:address_option] == "1"
      ship = Address.find(params[:order][:customer_id])
      @order.postal_code = ship.postal_code
      @order.address = ship.address
      @order.name = ship.name
    elsif params[:order][:address_option] = "2"
      @order.postal_code = params[:order][:post_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    else
      render :new
    end
      @cart_items = current_customer.cart_items.all
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
  
  def order_params
    params.require(:order).permit(:customer_id, :name, :address, :postal_code,
                                  :payment_amount, :addrress_type, :payment_method, :postage)
  end
end
