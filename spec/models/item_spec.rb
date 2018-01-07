require 'rails_helper'

RSpec.describe Item, type: :model do
  context "validations" do
    it "cannot save a valid item without a title" do
      category = create(:category)
      item = Item.new(description: "no bueno", price: 5.9, category: category)

      expect(item).to be_invalid
    end

    it "cannot save a valid item without a description" do
      category = create(:category)
      item = Item.new(title: "The Best", price: 5.9, category: category)

      expect(item).to be_invalid
    end

    it "cannot save a valid item without a price" do
      category = create(:category)
      item = Item.new(title: "Coffee", description: "no bueno", category: category)

      expect(item).to be_invalid
    end

    it "cannot save a valid item without a category" do
      item = Item.new(title: "Coffee", description: "no bueno", price: 1.4)

      expect(item).to be_invalid
    end

    it "can save a valid item without an image" do
      category = create(:category)
      item = Item.new(title: "Coffee", description: "bueno", price: 1.4, category: category)

      expect(item).to be_valid
    end

    it "cannot save a valid item with a price of 0" do
      category = create(:category)
      item = Item.new(title: "Coffee", description: "bueno", price: 0, category: category)

      expect(item).to be_invalid
    end
  end
end
