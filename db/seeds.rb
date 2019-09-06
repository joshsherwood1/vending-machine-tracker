# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Snack.destroy_all
Machine.destroy_all
Owner.destroy_all

sam = Owner.create(name: "Sam's Snacks")
mixed_drinks = sam.machines.create(location: "Don's Mixed Drinks")
basement = sam.machines.create(location: "Turing Basement")
snack_1 = basement.snacks.create(name: "Cheetos", price: 1.50)
snack_2 = basement.snacks.create(name: "Chocolate", price: 2.50)
snack_3 = mixed_drinks.snacks.create(name: "Gatorade", price: 3.50)
mixed_drinks.snacks << snack_1
