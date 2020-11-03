class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart, optional:true
  
  def total_price
    self.quantity * self.product.price
  end
end
