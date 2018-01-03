require "rails_helper"

describe "As a visitor" do
  context "I can place items in a cart" do
    before :each do
      @category = create(:category)
      @item = create(:item, image: "latte.jpg", category:@category)

    end

    it "when I go to items index, it displays an updated cart total and displays a flash message" do
      visit items_path

      click_button("Add to Cart")

      expect(page).to have_content("You now have 1 #{@item.title} in your cart!")
    end
  end
end
