# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

CSV.foreach('db/invoices.csv') do |row|
  Invoice.create(customer_id: row[0])
end

CSV.foreach('db/invoice_lines.csv') do |row|
  InvoiceLine.create(invoice_id: row[0], item_id: row[1], count: row[2])
end
