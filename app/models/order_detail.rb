class OrderDetail < ApplicationRecord
  
  enum making_status: { stopped_making: 0, waiting_for_production: 1,
                      in_production: 2, production_completed: 3 }

  belongs_to :order
  belongs_to :item
end
