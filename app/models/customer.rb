class Customer < ApplicationRecord
  has_many :orders

  def total
    total =0
    orders.each{ |o| total += o.total }
    return total
  end

end
