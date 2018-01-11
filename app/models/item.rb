class Item < ApplicationRecord
  validates_presence_of :title, :description, :price, :category_id, :retire_count
  validates_uniqueness_of :title
  validates :price, numericality: {greater_than: 0}

  belongs_to :category

  has_many :item_orders, dependent: :destroy
  has_many :orders, through: :item_orders

  enum status: ["Active", "Inactive"]

    def retired_count
      self.increment! :retire_count
    end

    def self.order_by_retire_count
      where("retire_count > '0'").order(:retire_count)
    end
end
