class Item < ApplicationRecord
  validates_presence_of :title, :description, :price, :category_id
  validates_uniqueness_of :title
  validates :price, numericality: {greater_than: 0}

  belongs_to :category

  has_many :item_orders
  has_many :orders, through: :item_orders

  enum status: ["Active", "Inactive"]
end
