class Item < ApplicationRecord
  has_one_attached :image
   
  has_many :cart_items
  
  validates :name, presence: true
  validates :introduction, presence: true
  validates :image, presence: true
  
  def with_tax_price
    (price*1.1).floor
  end
  
end
