require 'rails_helper'

describe "As a user" do
  context "when I go to a order index page " do
    before :each do
      @category = create(:category)
      @item = create(:item, image: "latte.jpg", category: @category)
      @cart = Cart.new(@item.id => 1)
      @user = User.create(username:"TYJ", password: "123", role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    end

    it "displays an index of all user orders organized by order ID" do

    visit cart_path

    expect(current_path).to eq(cart_path)
    
    click_on("Checkout")

    order = Order.create(status: "Paid", created_at: "2017-08-09",user_id: @user.id)

    ItemOrder.create(item_id: @item.id, order_id: order.id)

    expect(current_path).to eq(user_orders_path(@user))
    expect(page).to have_content("All Orders for #{@user.username}")
    expect(page).to have_content("#{order.id} placed on #{order.created_at}")
  end
end
end
