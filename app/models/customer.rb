class Customer < ApplicationRecord
  has_many :orders

  def total
    @customer.order.each |o|
    total =+ o.line_items.price
  end


end
