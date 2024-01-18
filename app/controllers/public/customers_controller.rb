class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  
  def show
     @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
      @customer = current_customer
    if @customer.update(customer_params)
      redirect_to public_customers_mypage_path
    else
      @customers = current_customer
      render :edit
    end
  end

  def withdrawal
  end

  def unsubscribe
    @customer = Customer.find(current_customer.id)
    @customer.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
  
  def customer_params
  params.require(:customer).permit(:email, :first_name, :last_name, :first_name_kana, :first_name_kana,
                                  :postal_code, :address, :telephone_number)
  end
end
