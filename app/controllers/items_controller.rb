class ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to items_path(@item.id)
  # else
  #   @item = Item.all
  #   render :index
  # end
  end 

  def index
    @items = Item.all
    @item = Item.new
  end

  def show
    @items = Item.find(params[:id])
  end

  def edit
    @items = Item.find(params[:id])
  end
end
