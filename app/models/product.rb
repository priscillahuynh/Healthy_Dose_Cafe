class Product < ApplicationRecord
  belongs_to :category
  has_many :line_items
  has_many :carts, through: :line_items
  has_one_attached :image

  validates :category_name, presence: true
  validates :name, presence: true
  validates :price, presence: true, numericality: true

  def category_name=(name)
    self.category = Category.find_or_create_by(name: name)
  end

  def category_name
     self.category ? self.category.name : nil
  end

end
