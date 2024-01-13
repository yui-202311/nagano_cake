class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
    @total_item = Item.count
  end

  def show
    @cart_item = CartItem.new
    @item = Item.find(params[:id])
  end
end

