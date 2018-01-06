require 'rails_helper'

describe "As a user" do
  context "when I go to a order index page " do
    before :each do
      @category = create(:category)
      @item = create(:item, image: "latte.jpg", category: @category)
      @cart = Cart.new(@item.id => 1)
      @user = User.create(username:"TYJ", password: "123", role: 0)

    end

    it "displays an index of all user orders organized by order ID" do

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    expect(current_path).to eq(cart_path)

    click_on("Check Out")

    order = Order.create(status_code: "Paid", total_price: @cart.total_price, date_time: "2017-08-09")

    ItemOrders.create(item_id: @item.id, order_id: order.id)

    expect(current_path).to eq(user_orders_path(@user))
    expect(page).to have_content("All Orders for #{@user.username}")
    expect(page).to have_content("#{order.id} placed on #{order.date_time}")
  end
end
