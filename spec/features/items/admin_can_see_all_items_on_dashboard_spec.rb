require 'rails_helper'

describe 'an admin sees all of items with status and edit button' do
  context 'it visits admin index' do
      before(:each) do
        admin = create(:user, role: 1)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
        @category = Category.create(title: 'coffee')
        @item_1 = create(:item, image: "latte.jpg", category:@category)
        @item_2 = create(:item, image: "latte.jpg", category:@category)
      end

    it 'sees all items displayed' do

      visit admin_items_path

      expect(page).to have_content @item_1.title
      expect(page).to have_content @item_1.description
      expect(page).to have_content @item_1.price
      expect(page).to have_content @item_1.status

      expect(page).to have_content @item_2.title
      expect(page).to have_content @item_2.description
      expect(page).to have_content @item_2.price
      expect(page).to have_content @item_2.status
    end
  end
end
