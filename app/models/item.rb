class Item < ApplicationRecord
  
  has_many :cart_items
  
  validates :price, presence: true
end
