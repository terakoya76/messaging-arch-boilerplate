class CreateOrderLines < ActiveRecord::Migration[6.0]
  def change
    create_table :order_lines do |t|
      t.references :order
      t.references :item
      t.integer :count, null:false, default:0
      t.timestamps
    end
  end
end
