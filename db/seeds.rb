# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

all_merchants = JSON.parse(File.read(Rails.root.join("db/seed_data/merchants.json")))
all_shoppers = JSON.parse(File.read(Rails.root.join("db/seed_data/shoppers.json")))
all_orders = JSON.parse(File.read(Rails.root.join("db/seed_data/orders.json")))

all_merchants['RECORDS'].each do |merchant| 
  Merchant.create(merchant)
end

all_shoppers['RECORDS'].each do |shopper| 
  Shopper.create(shopper)
end

all_orders['RECORDS'].each do |order| 
  Order.create(order)
end
