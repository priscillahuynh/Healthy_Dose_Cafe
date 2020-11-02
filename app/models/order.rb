class Order < ApplicationRecord
  belongs_to :user
  has_one :cart
  has_many :line_items, through: :cart
end
