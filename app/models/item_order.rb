class ItemOrder < ApplicationRecord

  belongs_to :item
  belongs_to :order



  def quantity
    byebug
  end
end
