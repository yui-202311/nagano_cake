class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @total_item_price = ItemPrice.count
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  def create
    @items = Item.find(cart_item_params[:item_id])
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
      redirect_to public_cart_items_path
    else
      render :show
    end
  end
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
