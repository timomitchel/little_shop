require 'rails_helper'


describe "As an admin" do
  context "when I click Analytics Dashboard from the Admin Dashboard" do
    before :each do
      @admin = create(:user, role: 1)
      @user = create(:user, role: 0)
      @user_2 = create(:user, role: 0)

      @category_1 = Category.create(title: "Coffee")
      @category_2 = Category.create(title: "Tea")

      @item_1 = Item.create(title: "Hot Coffee", description: "Black", price: 1.95, image: "latte.jpg", category: @category_1)
      @item_2 = Item.create(title: "Hot Tea", description: "White", price: 0.95, image: "latte.jpg", category: @category_2)

      @item_order_1 = ItemOrder.create(item_id: @item_1, order_id: @order_1, quantity: 3)
      @item_order_2 = ItemOrder.create(item_id: @item_2, order_id: @order_3, quantity: 2)

      @order_1 = create(:order, status: 0, user_id: @user.id)
      @order_2 = create(:order, status: 1, user_id: @user.id)
      @order_3 = create(:order, status: 2, user_id: @user.id)
      @order_4 = create(:order, status: 3, user_id: @user.id)
      @order_5 = create(:order, status: 0, user_id: @user_2.id)
      @order_6 = create(:order, status: 2, user_id: @user_2.id)


    end
    it "displays the user who has placed the most orders" do

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
      
      visit admin_dashboard_path

      click_link("Analytics Dashboard")
      expect(current_path).to eq(admin_analytics_dashboard_path)

      expect(page).to have_content("User who has placed the most orders: #{User.most_orders_placed}")

    end
  end
end
