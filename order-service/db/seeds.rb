# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

CSV.foreach('db/customers.csv') do |row|
  Customer.create(:first_name => row[0], :last_name => row[1])
end

CSV.foreach('db/items.csv') do |row|
  Item.create(:name => row[0], :price => row[1])
end

CSV.foreach('db/orders.csv') do |row|
  Order.create(:customer_id => row[0])
end

CSV.foreach('db/order_lines.csv') do |row|
  OrderLine.create(:order_id => row[0], :item_id => row[1], :count => row[2])
end
