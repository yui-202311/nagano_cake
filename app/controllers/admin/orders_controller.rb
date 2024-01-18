class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @customer = Customer.find(current_customer.id)
  end
end
