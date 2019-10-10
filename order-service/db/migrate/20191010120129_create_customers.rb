# frozen_string_literal: true

class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers, bulk: true do |t|
      t.string :first_name, null: false, default: ''
      t.string :last_name, null: false, default: ''
      t.timestamps
    end
  end
end
