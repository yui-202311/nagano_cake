class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @total_item = Item.count
  end

  def show
    @items = Item.find(params[:id])
  end
end

