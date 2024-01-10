class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
    @total_item = Item.count
  end

  def show
    @item = Item.find(params[:id])
  end
end

