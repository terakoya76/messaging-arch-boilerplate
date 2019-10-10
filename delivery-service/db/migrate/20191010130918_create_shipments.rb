# frozen_string_literal: true

class CreateShipments < ActiveRecord::Migration[6.0]
  def change
    create_table :shipments, bulk: true do |t|
      t.bigint :customer_id
      t.timestamps
    end
  end
end
