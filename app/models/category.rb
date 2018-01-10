class Category < ApplicationRecord
  before_save :generate_slug

  has_many :orders

  validates :title, presence: true, uniqueness: true
  has_many :items

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
