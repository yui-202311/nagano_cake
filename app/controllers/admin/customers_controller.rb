class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(customer_params)
  end

  def edit
     @customer = Customer.find(customer_params)
  end

  def update
      @customer = Customer.find(customer_params)
    if @customer.update(customer_params)
      redirect_to admin_customer_path
    else
      @customers = customer
      render :edit
    end
  end

  def customer_params
  params.require(:customer).permit(:email, :first_name, :last_name, :first_name_kana, :first_name_kana,
                                  :postal_code, :address, :telephone_number)
  end
end
