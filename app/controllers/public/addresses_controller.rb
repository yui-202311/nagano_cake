class Public::AddressesController < ApplicationController
   before_action :authenticate_customer!
   
  def index
    @addresses = Address.all
    @address = Address.new
  end

  def create
      @address = Address.new(address_params)
    if @address.save
      redirect_to public_addresses_path
    else
      @addresses = Address.all
      render :index
    end
  end
  
  def edit
    @address = Address.find(params[:id])
  end

  def update
  end

  def delete
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to public_addresses_path
  end
  
  private
  
  def address_params
    params.require(:address).permit(:customer_id, :postal_code, :address, :name)
  end
  
end
