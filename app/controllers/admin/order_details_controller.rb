class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
       @order_detail = OrderDetail.find(params[:id])
       @order = @order_detail.order
    if @order_detail.update(order_detail_params)
       @order.update(status: 2) if @order_detail.making_status == 'in_production'
      if is_all_order_details_making_completed(@order)
         @order.update(status: 3)
      end  
    end
    
       redirect_to admin_order_path(@order_detail.order)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
  
  def is_all_order_details_making_completed(order)
    order.order_details.each do |order_detail|
      if order_detail.making_status != 'production_completed'
        return false 
      end
    end
    return true 
  end  

end
