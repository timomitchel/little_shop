require 'rails_helper'

RSpec.describe Cart do
  subject { Cart.new({"1" => 2, "2" => 3}) }

  describe "#total_count" do
    it "can calculate the total number of items held" do
      cart = Cart.new({"1" => 2, "2" => 3})
      expect(cart.total_count).to eq(5)
    end
  end

  describe "#add_item" do
    it "adds an item to its contents" do
      subject.add_item(1)
      subject.add_item(2)

      expect(subject.contents).to eq({"1" => 3, "2" => 4})
    end
  end

  describe "#subtract_item" do
    it "subtracts an item to its contents" do
      subject.subtract_item(1)
      subject.subtract_item(2)

      expect(subject.contents).to eq({"1" => 1, "2" => 2})
    end
  end


  describe "#count_of" do
    it "reports how many of a particular item" do
      expect(subject.count_of(1)).to eq(2)
      expect(subject.count_of(2)).to eq(3)
    end
  end
  describe "subtotal" do
    it "calculates correct subtotal" do
      category = Category.create(title: "Coffee")
      item = Item.create(title: "Coffee", description: "Coffee", price: 1.95, image: 'latte.jpg', category: category)
      cart = Cart.new({"1" => 2, "2" => 3})

      expect(subject.subtotal(item.id)).to eq(0)
    end
  end
end
