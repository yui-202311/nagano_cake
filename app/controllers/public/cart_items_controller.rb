class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
    @total = 0
  end

  def update
      @cart_items = CartItem.find(params[:id])
    if @cart_items.update(cart_item_params)
      redirect_to public_cart_item_path
    else
      @cart_items = CartItem.find(params[:id])
      render :index
    end
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    cart_items = current_customer.cart_items
    cart_items.destroy_all
    redirect_to public_items_path
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
    params.require(:cart_item).permit(:item_id, :amount, :name, :image)
  end
end
