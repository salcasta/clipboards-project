class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :category
      t.string :product_type
      t.string :label
      t.string :unit
      t.integer :price
      t.integer :pack_size
      t.string :item_size
      t.integer :pack_cost
      t.integer :user_id
      t.string :area
      t.integer :vendor_id
      t.string :vendor_serial_number
      t.integer :inventory_sheets_id

      t.timestamps
    end
  end
end
