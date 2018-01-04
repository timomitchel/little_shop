class Order < ApplicationRecord
  validates_presence_of :status,
                        :total_price

  belongs_to :user

  
  enum status: [:ordered, :paid, :cancelled, :completed]
end
