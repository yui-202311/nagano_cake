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
    @order.save
    current_member.cart_items.each do |cart_item|
    @ordered_item = OrderedItem.new
    @ordered_item.item_id = cart_item.item_id #商品idを注文商品idに代入
    @ordered_item.amount = cart_item.amount #商品の個数を注文商品の個数に代入
    @ordered_item.tax_included_price = (cart_item.item.price*1.08).floor #消費税込みに計算して代入
    @ordered_item.order_id =  @order.id #注文商品に注文idを紐付け
    @ordered_item.save #注文商品を保存
  end
    current_customer.cart_items.destroy_all #カートの中身を削除
    redirect_to public_orders_complete_path
  end

  def index
    @orders = Order.all
  end

  def show
  end

  def order_params
    params.require(:order).permit(:customer_id, :name, :address, :postal_code, :total_payment,
                                  :payment_amount, :addrress_type, :payment_method, :postage)
  end
end
