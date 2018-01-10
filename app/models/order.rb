class Order < ApplicationRecord

  has_many :item_orders, dependent: :delete_all
  has_many :items, through: :item_orders, dependent: :delete_all
  has_many :category_orders
  has_many :categories, through: :category_orders

  belongs_to :user

  enum status: ["ordered", "paid", "cancelled", "completed"]

  def self.ordered_count
    where(status: "ordered").count
  end

  def self.paid_count
    where(status: "paid").count
  end

  def self.cancelled_count
    where(status: "cancelled").count
  end

  def self.completed_count
    where(status: "completed").count
  end

  def update_status_paid
    update(status: 1)
  end

  def update_status_complete
    update(status: 3)
  end

  def cart_assignment(cart)
    result = 0.0
    cart.each do |id, quantity|
       result += Item.find(id).price * quantity
       ItemOrder.create(item_id: id, order_id: self.id, quantity: quantity)
     end
    result
  end

  def total_price
    result = 0
    self.items.each do |item|
     result += item.price
    end
    result
  end

  def subtotal
    item_hash = items.group(:item_id).count
    result = 0
    item_hash.each do |item, quantity|
      result += Item.find(item).price * quantity
    end
    result
  end

  def self.organize_states
    order = Order.joins(:user)
    .where(status: "completed")
    .order("state ASC")
    .group(:state).count

  end

  def self.sort_states
    organize_states.sort_by do |key, value|
      value
    end.to_h
  end
end
