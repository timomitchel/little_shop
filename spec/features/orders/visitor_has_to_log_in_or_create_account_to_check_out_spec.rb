require 'rails_helper'

describe "As a visitor" do
  context "when i add things to my cart and click view cart" do
    before(:each) do
      @category = create(:category)
      @item = create(:item, image: "latte.jpg", category: @category)
      @cart = Cart.new(@item.id => 1)

      user = User.create(username:"TYJ", password: "123", role: 0)
      visit items_path
    end

    xit "will display a link that will say Login or Create Account to Checkout instead of a checkout button" do
      click_button 'Add to Cart'

      expect(page).to have_content "Cart: 1"

      click_link "Login or Create Account to Checkout"

      expect(current_path).to eq(sign_in_path)

      fill_in"username", with: "TYJ"
      fill_in"password", with: "123"

      click_on("Log In")

      expect(current_path).to eq(cart_path)

      click_on("Check Out")

      expect(current_path).to eq(order_path(Order.last.idea))
      expect(page).to have_content(@cart.title)
  end

  xit "will display a link that will say Login or Create Account to Checkout instead of a checkout button" do
    click_button 'Add to Cart'

    expect(page).to have_content "Cart: 1"

    click_link "Login or Create Account to Checkout"

    expect(current_path).to eq(sign_in_path)

    click_on("Create Account")

    fill_in "user[username]", with: "JavaJoe"
    fill_in "user[password]", with: "joe123"

    click_button "Create Account"

    expect(current_path).to eq(cart_path)

    click_on("Check Out")

    expect(current_path).to eq(order_path(Order.last.idea))
    expect(page).to have_content(@cart.title)
  end
end
end
