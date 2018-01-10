class Category < ApplicationRecord
  before_save :generate_slug

  validates :title, presence: true, uniqueness: true
  has_many :items

  def generate_slug
    self.slug = title.parameterize
  end

  def highest_priced_item
    items.maximum(:price)
  end

  def orders_placed
    item_orders = []
    items.each do |item|
     item_orders << ItemOrder.where(item_id: item.id)
    end
   item_orders.count
  end
end
