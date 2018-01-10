class CategoryOrder < ApplicationRecord

  belongs_to :category
  belongs_to :order
end