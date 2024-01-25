class Public::HomesController < ApplicationController
  before_action :authenticate_customer!, except: [:top, :about]
  
  def top
    @items = Item.page(params[:page])
  end

end
