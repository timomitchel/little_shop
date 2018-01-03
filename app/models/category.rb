class Category < ApplicationRecord
  before_save :generate_slug

  validates :title, presence: true, uniqueness: true
  has_many :items

  def generate_slug
    self.slug = title.parameterize
  end
end
