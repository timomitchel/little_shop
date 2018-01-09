require 'rails_helper'

describe "As a user" do
  context "when I go to a order index page " do
    before :each do
      @category = create(:category)
      @item = create(:item, image: "latte.jpg", category: @category)
      @user = User.create(username:"TYJ", password: "123", role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    end

    it "displays an index of all user orders organized by order ID" do

      visit items_path

      click_on "Add to Cart"
      click_on "View Cart"
      expect(current_path).to eq(cart_path)

      click_on("Checkout")


      expect(current_path).to eq(user_orders_path(@user))
      expect(page).to have_content("All Orders for #{@user.username}")
      expect(page).to have_content("#{@user.orders.first.id} placed on #{@user.orders.first.created_at}")

      visit items_path

      click_on "Add to Cart"
      click_on "View Cart"
      expect(current_path).to eq(cart_path)

      click_on("Checkout")


      expect(current_path).to eq(user_orders_path(@user))
      expect(page).to have_content("All Orders for #{@user.username}")
      expect(page).to have_content("#{@user.orders.last.id} placed on #{@user.orders.last.created_at}")

      visit dashboard_path
      
      expect(page).to have_content("Go to your Orders")

      click_link "Go to your Orders"

      expect(current_path).to eq(user_orders_path(@user))

      expect(page).to have_content("All Orders for #{@user.username}")
    end
end
end
