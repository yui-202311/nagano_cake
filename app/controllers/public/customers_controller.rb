class Public::CustomersController < ApplicationController
  def show
     @customer = Customer.find(params[:id])
  end

  def edit
  end

  def update
  end

  def withdrawal
  end

  def unsubscribe
    @customer = Customer.find(params[:id])
    @customer.update(is_active: false)
    redirect_to customer_path(@customer.id)
  end
end
