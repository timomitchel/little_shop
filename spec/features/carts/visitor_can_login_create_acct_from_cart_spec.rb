require 'rails_helper'

describe "A guest visitor can log in or create accout from cart page" do
  context "click view cart" do
    it " it shows login or create account links" do
      category = Category.create(title: "coffee")
      coffee_1 = Item.create(title: "French Roast", description: "1 Pound of Deliciousio!", price: 2.95, image: "latte.jpg",  category: category)

      visit items_path

      click_on "Add to Cart"
      click_on "View Cart"

      expect(current_path).to eq(cart_path)
      expect(page).to have_content("Login")
      expect(page).to have_content("Create Account to Checkout")
      expect(page).to_not have_button("Checkout")
    end
  end
  context "user creates a new account" do
    it "items in cart are still in cart" do
      category = Category.create(title: "coffee")
      coffee_1 = Item.create(title: "French Roast", description: "1 Pound of Deliciousio!", price: 2.95, image: "latte.jpg",  category: category)

      visit items_path
      click_on "Add to Cart"

      click_on "View Cart"
      click_on "Login or Create Account to Checkout"
      click_on "Create Account"

      fill_in "user[username]", with: "JavaJoe"
      fill_in "user[password]", with: "joe123"
      click_button "Create Account"

      click_on "View Cart"

      expect(page).to have_content(coffee_1.title)
      expect(page).to have_content(coffee_1.description)
      expect(page).to have_content(coffee_1.price)
      expect(page).to have_link("Checkout")

    end
  end
end
