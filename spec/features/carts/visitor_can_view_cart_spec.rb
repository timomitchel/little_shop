require 'rails_helper'

describe 'visitor can click on view cart and see items in cart' do 
  context 'visitor visits all items page' do 
    context 'visitor clicks add to cart on an item' do 
      before(:each) do 
        @category = create(:category)
        @item = create(:item, image: "latte.jpg", category: @category)
        @cart = Cart.new(@item.id => Item.all.count)
      end
      it 'clicks on view cart and sees item in cart' do 

        visit items_path

        click_button 'Add to Cart'

        expect(page).to have_content "Cart: 1"

        click_link "View Cart"
        
        expect(current_path).to eq cart_path 
        expect(page).to have_content @item.title
        expect(page).to have_content @item.description
        expect(page).to have_content @item.price
        expect(page).to have_content "Total Price: $#{@cart.total_price}"
      end
    end
  end
end