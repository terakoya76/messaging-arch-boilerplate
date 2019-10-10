class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items, bulk: true do |t|
      t.string :name, null:false, default:''
      t.integer :price, null:false, default:0
      t.timestamps
    end
  end
end
