require 'rails_helper'

describe "As a user" do
  context "when I go to a specific order show page " do
    before :each do
      @category = create(:category)
      @item = create(:item, image: "latte.jpg", category: @category)
      @user = User.create(username:"TYJ", password: "123", role: 0)
      @user_2 = User.create(username:"Java", password: "456", role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end
    it "displays a order details such as item title, item price, description, and image, with order status, total price of order, and date/time of order submission" do

      visit items_path

      click_on "Add to Cart"
      click_on "View Cart"
      expect(current_path).to eq(cart_path)

      click_on("Checkout")

      expect(current_path).to eq(user_orders_path(@user))

      expect(page).to have_content("All Orders for #{@user.username}")

      click_link("#{@user.orders.last.id}")

      expect(current_path).to eq(user_order_path(@user, @user.orders.last.id))

      expect(page).to have_content("Order Status: #{@user.orders.last.status}")
      expect(page).to have_content("Date & Time Ordered: #{@user.orders.last.created_at}")
      expect(page).to have_content("Total Price: #{@user.orders.last.total_price}")

      # expect(page).to have_content("Item Subtotal: #{@cart.subtotal}")
      #
      # expect(page).to have_content("Item Name: #{@item.title}")
      # expect(page).to have_content("Item Description: #{@item.description}")
      # expect(page).to have_content("Item Image: #{@item.image}")
    end

    xit "wont show another users order" do

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit items_path

      click_on "Add to Cart"

      click_on "View Cart"

      click_on "Checkout"

      expect(current_path).to eq('/orders')
      expect(page).to have_content("##{Order.last.id}")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)

      visit "/orders"

      expect(page).not_to have_content("Order ##{Order.last.id}")
    end
  end
end
