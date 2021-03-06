# frozen_string_literal: true

class CreateInvoiceLines < ActiveRecord::Migration[6.0]
  def change
    create_table :invoice_lines, bulk: true do |t|
      t.references :invoice
      t.bigint :item_id
      t.integer :count, null: false, default: 0
      t.timestamps
    end
  end
end
