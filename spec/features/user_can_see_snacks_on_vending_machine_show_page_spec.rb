require 'rails_helper'

RSpec.describe "When a user visits the vending machine show page", type: :feature do
  scenario "they see a list of snacks associated with that vending machine along with the price and average price of all snacks" do
    sam = Owner.create(name: "Sam's Snacks")
    mixed_drinks = sam.machines.create(location: "Don's Mixed Drinks")
    basement = sam.machines.create(location: "Turing Basement")
    snack_1 = basement.snacks.create(name: "Cheetos", price: 1.50)
    snack_2 = basement.snacks.create(name: "Chocolate", price: 2.50)
    snack_3 = mixed_drinks.snacks.create(name: "Gatorade", price: 3.50)
    snack_4 = mixed_drinks.snacks.create(name: "Soda", price: 5.00)
    #visit "/machines/#{basement.id}"
    visit machine_path(basement)
    expect(page).to have_content("#{snack_1.name}")
    expect(page).to have_content("Price: $#{snack_1.price}")
    expect(page).to have_content("#{snack_2.name}")
    expect(page).to have_content("Price: $#{snack_2.price}")
    expect(page).to have_content("Average Price for All Snacks: $2.00")

    #visit "/machines/#{mixed_drinks.id}"
    visit machine_path(mixed_drinks)
    expect(page).to have_content("#{snack_3.name}")
    expect(page).to have_content("Price: $#{snack_3.price}")
    expect(page).to have_content("#{snack_4.name}")
    expect(page).to have_content("Price: $#{snack_4.price}")
    expect(page).to have_content("Average Price for All Snacks: $4.25")
  end
end
