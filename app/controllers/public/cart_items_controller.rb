class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
    # @cart_item = current_customer.cart_items(cart_item_params)
    @total = 0
  end

  def update
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if @cart_item.save
      redirect_to public_cart_items_path
    else
      render :show
    end
  end
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :name)
  end
end
