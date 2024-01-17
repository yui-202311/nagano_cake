class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
      @total = 0
      @order = Order.new(order_params)
    if params[:order][:address_type] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
      @order.customer_id = current_customer
    elsif params[:order][:address_type] == "1"
      ship = Address.find(params[:order][:customer_id])
      @order.postal_code = ship.postal_code
      @order.address = ship.address
      @order.name = ship.name
    elsif params[:order][:address_type] == "2"
      # @order.postal_code = params[:order][:postal_code]
      # @order.address = params[:order][:address]
      # @order.name = params[:order][:name]
    else
      render :new
    end
     # byebug
    @cart_items = current_customer.cart_items.all
  end


  def complete
  end

  def create
      @order = Order.new(order_params)
      @order.customer_id = current_customer.id
      @order.save!
    current_customer.cart_items.each do |cart_item|
      @order_details = OrderDetail.new
      @order_details.item_id = cart_item.item_id
      @order_details.amount = cart_item.amount
      @order_details.price = (cart_item.item.price*1.08).floor
      @order_details.order_id = @order.id
      @order_details.save
    end
      items = current_customer.cart_items
      items.destroy_all
      redirect_to public_orders_complete_path
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @total = 0
  end

  def order_params
    params.require(:order).permit(:customer_id, :name, :address, :postal_code,
                                  :payment_amount, :addrress_type, :payment_method, :postage)
  end
end
