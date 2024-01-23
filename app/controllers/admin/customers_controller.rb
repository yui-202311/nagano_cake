class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
     @customer = Customer.find(params[:id])
  end

  def update
      # @customers = Customer.find(current_customer.id)
      # @customers.update(is_active: false)
      # reset_session
      # redirect_to root_path

      @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path
    else
      @customers = customer
      render :edit
    end
  end

private

  def customer_params
  params.require(:customer).permit(:email, :first_name, :last_name, :first_name_kana, :first_name_kana,
                                  :postal_code, :address, :telephone_number)
  end
end
