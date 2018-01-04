require 'rails_helper'

describe 'visitor can click on view cart and see items in cart' do 
  context 'visitor visits all items page' do 
    context 'visitor clicks add to cart on an item' do 
      before(:each) do 
        @category = create(:category)
        @item = create(:item, image: "latte.jpg", category: @category)
        @cart = Cart.new(@item.id => Item.all.count)
        visit items_path
      end
      it 'clicks on view cart and sees item in cart' do 

        click_button 'Add to Cart'

        expect(page).to have_content "Cart: 1"

        click_link "View Cart"
        
        expect(current_path).to eq cart_path 
        expect(page).to have_content @item.title
        expect(page).to have_content @item.description
        expect(page).to have_content @item.price
        expect(page).to have_content "Total Price: $#{@cart.total_price}"
      end
      it 'can destroy an item in the cart' do 
        click_button 'Add to Cart'
        click_link "View Cart"
        click_link "Remove"     
        
        expect(current_path).to eq cart_path
        expect(page).to have_content "Successfully removed #{@item.title} from your cart!"
        expect(page).to_not have_content @item.price
        expect(page).to have_content "Cart: 0"
      end
    end
  end
end