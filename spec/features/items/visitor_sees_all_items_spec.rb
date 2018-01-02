require 'rails_helper'

describe 'a visitor sees all of shops available items' do
  context 'it visits root' do 
    context 'it clicks all items' do 
      before(:each) do 
        @category = Category.create(title: 'coffee')
        @item_1 = create(:item, image: "latte.jpg", category:@category)
        @item_2 = create(:item, image: "latte.jpg", category:@category)

      end
      it 'sees all items displayed' do 
         
        visit '/'

        click_on 'all items'

        expect(current_path).to eq(items_path)
        expect(page).to have_content @item_1.title
        # expect(page).to have_link 'Sign Up'
        # expect(page).to have_link 'Log In'
        expect(page).to have_content @item_2.title
        expect(page).to have_content @item_2.description
        expect(page).to have_content @item_2.price
      end
    end
  end
end
