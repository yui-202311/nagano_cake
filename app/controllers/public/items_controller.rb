class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @items = Item.page(params[:page])
    @total_item = Item.count
  end

  def show
    @cart_item = CartItem.new
    @item = Item.find(params[:id])
  end
end

