class Customer < ApplicationRecord
  has_many :orders

  def total
    total =0
    orders.each do |o|
    total += o.total
  end
  return total
  end

end
