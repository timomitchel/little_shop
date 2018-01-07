require 'rails_helper'

describe "Admin can edit an existing item" do
  scenario "an admin can edit items" do

  admin = create(:user, role: 1)
  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  category = create(:category)
  item = create(:item, category: category)

  visit edit_admin_item_path(item)

  fill_in "item[title]", with: "New Item"
  fill_in "item[description]", with: "New Description"
  fill_in "item[price]", with: 7.4

  click_button "Update Item"

  expect(page).to have_content("New Item")
  end
end
