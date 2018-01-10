class Category < ApplicationRecord
  before_save :generate_slug

  validates :title, presence: true, uniqueness: true
  has_many :items
  has_many :category_orders
  has_many :orders, through: :category_orders

  def generate_slug
    self.slug = title.parameterize
  end

  def highest_priced_item
    items.maximum(:price)
  end

  def orders_placed
    orders.count
  end
end
