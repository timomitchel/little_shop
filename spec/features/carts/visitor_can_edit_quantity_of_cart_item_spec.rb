require 'rails_helper'


describe "As a visitor" do
  context "when I have an item in my cart" do
    before :each do
      @category = create(:category)
      @item = create(:item, image: "latte.jpg", category: @category)
      @cart = Cart.new(@item.id => 1)

      visit items_path

      click_button("Add to Cart")

      click_link "View Cart"
    end

    it "displays my total and has an option for me to update that total with an update button which will then refresh the page with the updated amount" do

      expect(current_path).to eq cart_path

      expect(page).to have_content("Quantity: 1")

      click_link("+")
      expect(page).to have_content("Quantity: 2")
      click_link("-")
      click_link("-")
      

      expect(page).to have_content "Cart: 0"
    end
  end
end
