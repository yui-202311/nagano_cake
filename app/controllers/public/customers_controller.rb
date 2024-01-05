class Public::CustomersController < ApplicationController
  def show
     @customer = Customer.find(params[:id])
  end

  def edit
  end

  def update
  end

  def with_drawal
  end

  def unsubscribe
  end
end
