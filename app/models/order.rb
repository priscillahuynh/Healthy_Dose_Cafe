class Order < ApplicationRecord
  belongs_to :user
  has_one :cart
  has_many :line_items, through: :cart

  scope :most_recent, -> {joins(:user).group(:id).order('created_at desc')}
end
