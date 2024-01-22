class Public::AddressesController < ApplicationController
   before_action :authenticate_customer!

  def index
    @addresses = Address.all
    @address = Address.new
    @customer = current_customer
  end

  def create
      @address = Address.new(address_params)
      @address.customer_id = current_customer.id
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
       @address = Address.find(params[:id])
    if @address.update(address_params)
       redirect_to public_addresses_path
    else
       @addresses = Address.find(params[:id])
       render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to public_addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:customer_id, :postal_code, :address, :name)
  end

end
