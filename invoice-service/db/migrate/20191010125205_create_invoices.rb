# frozen_string_literal: true

class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices, bulk: true do |t|
      t.bigint :customer_id
      t.timestamps
    end
  end
end
