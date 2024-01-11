class Public::CartItemsController < ApplicationController
  def index
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
      redirect_to public_cart_items_path
    else
      render :show
    end
  end
  
  def cart_item_params
    params.require(:cart_item).permit(:name, :introduction, :price, :image)
  end
end
