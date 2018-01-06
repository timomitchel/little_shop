class Item < ApplicationRecord


  belongs_to :category

  has_many :item_orders
  has_many :orders, through: :item_orders
end
