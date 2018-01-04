require 'rails_helper'

describe "As a visitor" do
  context "when I go to items show" do
    it "displays item picture and item attributes" do
      @category = create(:category)
      @item = create(:item, image: "latte.jpg", category:@category)

      visit item_path(@item)

      expect(page).to have_content(@item.title)
      expect(page).to have_content(@item.description)
      expect(page).to have_content(@item.price)


      click_button("Add to Cart")

      expect(page).to have_content("You now have 1 #{@item.title} in your cart!")
    end

    it "will redirect to items index if i click all items" do
      @category = create(:category)
      @item = create(:item, image: "latte.jpg", category:@category)

      visit item_path(@item)



      click_link("All Items")

      expect(current_path).to eq(items_path)
    end
  end
end
