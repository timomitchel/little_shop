require "rails_helper"

describe "As a visitor, when I go to /coffee, I go to all items associated with the coffee category" do
  it "displays each coffee item thats in the database" do
    category = Category.create(title: "coffee")

    coffee_1 = Item.create(title: "French Roast", description: "1 Pound of Deliciousio!", price: 2.95, image: "latte.jpg",  category: category)

    coffee_2 = Item.create(title: "Dark Roast", description: "1 Pound of Darkness!", price: 1.95, image: "latte.jpg", category: category)

    coffee_3 = Item.create(title: "Decaf", description: "1 Pound of Who Drinks this anyways?!", price: 1.95, image: "latte.jpg", category: category)



    visit category_path(category.slug)

    expect(current_path).to eq("/#{category.title}")

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
  it "sees the tea link and can click it" do
    category = Category.create(title: "tea")

    tea = Item.create(title: "Green", description: "1 Pound", price: 1.95, image: "latte.jpg", category: category)


    visit category_path(category.slug)

    expect(current_path).to eq("/#{category.title}")

    expect(page).to have_content(tea.title)
    expect(page).to have_content(tea.description)
    expect(page).to have_content(tea.price)
  end
end
