# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
customer = Customer.create!(first_name: Faker::Name.first_name ,last_name: Faker::Name.last_name, email: Faker::Internet.email ,address: Faker::Address.full_address )
tea = Tea.create!(title: Faker::Tea.variety, description: Faker::Tea.type, temperature: Faker::Number.between(from: 170, to: 212), brew_time: Faker::Number.between(from: 1, to: 10) )
subscription = Subscription.create!(   customer_id: customer.id ,tea_id: tea.id, title:Faker::Subscription.plan, price: Faker::Commerce.price(range: 0..10.0), status: "Active",frequency: "Daily")
