class Order < ApplicationRecord
  belongs_to :customer
  has_many :line_items
  has_many :pumpkins, through: :line_items
  # has_many(:pumpkins, {through: :line_items})


 def total
   total = 0
   line_items.each { |li| total += li.price}
   return total
 end


end
