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
  end
end
