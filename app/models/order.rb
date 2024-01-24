class Order < ApplicationRecord

  enum payment_method: { credit_card: 0, transfer: 1 }

  enum status: { waiting_for_payment: 0, payment_confirmation: 1,
                in_production: 2, preparation_for_shipping: 3, shipped: 4 }
                
  belongs_to :customer
  has_many :order_details
  has_many :items, through: :order_details

  def full_address
    '〒' + self.postal_code + ' ' + self.address + ' ' + self.name
  end

  def subtotal
    cart_items.with_tax_price * amount
  end

  # def total
  #   order.price*amount
  # end
end
