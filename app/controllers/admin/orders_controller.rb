class Admin::OrdersController < ApplicationController
  def show
    @customer = Customer.find(current_customer.id)
  end
end
