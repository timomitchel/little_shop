require 'rails_helper'

describe "As a visitor" do
  context "when i add things to my cart and click view cart" do
    before(:each) do
      @category = create(:category)
      @item = create(:item, image: "latte.jpg", category: @category)
      @cart = Cart.new(@item.id => 1)
      visit items_path
    end

    it "will display a link that will say Login or Create Account to Checkout instead of a checkout button" do
      click_button 'Add to Cart'

      expect(page).to have_content "Cart: 1"

      click_link "Login or Create Account to Checkout"

      expect(current_path).to eq(sign_in_path)

      
  end
end
