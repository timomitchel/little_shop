require 'rails_helper'

describe "As a user" do
  context "when I go to a specific order show page " do
    before :each do
      @category = create(:category)
      @item = create(:item, image: "latte.jpg", category: @category)
      @cart = Cart.new(@item.id => 1)
      @user = User.create(username:"TYJ", password: "123", role: 0)
      @user_2 = User.create(username:"Java", password: "456", role: 0)

    end

    it "displays an index of all user orders organized by order ID" do


    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    expect(current_path).to eq(cart_path)

    click_on("Check Out")

    Order.create(status_code: "Paid", total_price: @item.price, date_time: "2017-08-09")

    ItemOrders.create(item_id: @item.id, order_id: Order.last.id)
    expect(current_path).to eq(order_path(Order.last.idea))

    expect(current_path).to eq(user_orders_path(@user))
    expect(page).to have_content("All Orders for #{@user.username}")
    expect(page).to have_content("#{Order.last.id} placed on #{Order.last.date_time}")
  end
end
