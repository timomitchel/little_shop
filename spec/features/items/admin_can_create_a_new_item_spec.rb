require 'rails_helper'

describe "Admin creates a new item" do
  scenario "an admin can create a new item" do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    category = Category.create(title: "Tea")
    category2 = Category.create(title: "Coffee")
    visit new_admin_item_path

    fill_in "item[title]", with: "Earl Grey"
    fill_in "item[description]", with: "Yummy"
    fill_in "item[price]", with: 2.10
    select category.title, from: "item[category_id]"
    click_button "Create Item"

    expect(current_path).to eq(items_path)
    expect(page).to have_content("Earl Grey")
    expect(page).to have_content("Yummy")
    expect(page).to have_content("2.1")
  end
end
