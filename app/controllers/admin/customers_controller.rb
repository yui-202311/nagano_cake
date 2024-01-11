class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    
  end

  def update
  end
end
