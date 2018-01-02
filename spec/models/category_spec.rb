require 'rails_helper'

RSpec.describe Category, type: :model do
  context "validations" do
    it "cannot save a valid category without a title" do
      category = Category.new()

      expect(category).to be_invalid
    end

    it "can save a valid category with a title" do
      category = Category.new(title: "Coffee")

      expect(category).to be_valid
    end
  end
end
