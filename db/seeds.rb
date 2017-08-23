# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

2.times do |i|
  user = User.new(email: "admin#{i + 1}@tektonAdmin.com",
                  password: '12345678', # Devise.friendly_token[0,20]
                  password_confirmation: '12345678')

  user.profile = Admin.new(name: "admin#{i + 1}")
  user.save
end

2.times do |i|
  user = User.new(email: "chef#{i + 1}@tektonChef.com",
                  password: '12345678', # Devise.friendly_token[0,20]
                  password_confirmation: '12345678')

  user.profile = Chef.new(name: "chef#{i + 1}")
  user.save
end

2.times do |i|
  user = User.new(email: "cashier#{i + 1}@tektonCashier.com",
                  password: '12345678', # Devise.friendly_token[0,20]
                  password_confirmation: '12345678')

  user.profile = Cashier.new(name: "Cashier#{i + 1}")
  user.save
end

chef = Chef.first()

5.times do |i|
  dish = Dish.new(name: "Plato#{i}", description: "Tiene #{i} ingerdientes",
                  price: 18.50, chef_id: chef.id)
  dish.save
end

2.times do |i|
  user = User.new(email: "Customer#{i + 1}@tektonuser.com",
                  password: '12345678', # Devise.friendly_token[0,20]
                  password_confirmation: '12345678')

  user.profile = Customer.new(name: "Customer#{i + 1}")
  user.save
end
