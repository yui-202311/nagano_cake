class Item < ApplicationRecord
  has_one_attached :image
   
  has_many :cart_items
  has_many :ordered_items
  has_many :items, through: :orderd_items
  
  validates :name, presence: true
  validates :introduction, presence: true
  validates :image, presence: true
  
  def with_tax_price
    (price*1.1).floor
  end
  
end
