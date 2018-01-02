require "rails_helper"

describe "As a visitor, when I go to /coffee, I go to all items associated with the coffee category" do
  it "displays each coffee item thats in the database" do
    category = Category.create(title: "Coffee")

    coffee_1 = Item.create(title: "French Roast", description: "1 Pound of Deliciousio!", price: "$2.95", category: category)

    coffee_2 = Item.create(title: "Dark Roast", description: "1 Pound of Darkness!", price: "$1.95", category: category)

    coffee_3 = Item.create(title: "Decaf", description: "1 Pound of Who Drinks this anyways?!", price: "$1.95", category: category)

    visit "/coffee"

    expect(page).to have_content(coffee_1.title)
    expect(page).to have_content(coffee_1.description)
    expect(page).to have_content(coffee_1.price)

    expect(page).to have_content(coffee_2.title)
    expect(page).to have_content(coffee_2.description)
    expect(page).to have_content(coffee_2.price)

    expect(page).to have_content(coffee_3.title)
    expect(page).to have_content(coffee_3.description)
    expect(page).to have_content(coffee_3.price)
  end
end
