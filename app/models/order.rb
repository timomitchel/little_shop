class Order < ApplicationRecord

  has_many :item_orders
  has_many :items, through: :item_orders

  belongs_to :user

  enum status: ["ordered", "paid", "cancelled", "completed"]

  def cart_assignment(cart)
    result = 0.0
    cart.each do |id, quantity|
       result += Item.find(id).price * quantity
       ItemOrder.create(item_id: id, order_id: self.id)
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
    items.collect do |item|
      Item.where(id: item.id)
    end
  end
end