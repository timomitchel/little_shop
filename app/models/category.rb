class Category < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  has_many :items

  def to_param
    title
  end
end
