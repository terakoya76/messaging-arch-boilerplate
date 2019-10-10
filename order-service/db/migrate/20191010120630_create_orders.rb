# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders, bulk: true do |t|
      t.references :customer
      t.timestamps
    end
  end
end
