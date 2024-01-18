class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
     @customer = Customer.find(current_customer.id)
  end

  def update
      @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
      redirect_to admin_customer_path
    else
      @customers = current_customer
      render :edit
    end
  end
  
  def customer_params
  params.require(:customer).permit(:email, :first_name, :last_name, :first_name_kana, :first_name_kana,
                                  :postal_code, :address, :telephone_number)
  end
end
