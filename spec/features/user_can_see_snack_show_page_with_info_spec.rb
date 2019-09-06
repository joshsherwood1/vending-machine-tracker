require 'rails_helper'

RSpec.describe "When a user visits a snack show page", type: :feature do
  scenario "they see snack name, price, machines where it is located, and machine info" do
    sam = Owner.create(name: "Sam's Snacks")
    mixed_drinks = sam.machines.create(location: "Don's Mixed Drinks")
    basement = sam.machines.create(location: "Turing Basement")
    snack_1 = basement.snacks.create(name: "Cheetos", price: 1.50)
    snack_2 = basement.snacks.create(name: "Chocolate", price: 2.50)
    snack_3 = mixed_drinks.snacks.create(name: "Gatorade", price: 3.50)
    mixed_drinks.snacks << snack_1

    visit snack_path(snack_1)

    expect(page).to have_content("#{snack_1.name}")
    expect(page).to have_content("Price: $#{snack_1.price}")
    expect(page).to have_content("#{mixed_drinks.location}")
    expect(page).to have_content("2 kinds of snacks, average price of $2.50")
    expect(page).to have_content("#{basement.location}")
    expect(page).to have_content("2 kinds of snacks, average price of $2.00")
  end
end
