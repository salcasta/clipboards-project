class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :item_id
      t.integer :inventory_sheets_id
      t.integer :quantity
      t.integer :on_hand
      t.integer :par_level
      t.integer :rank
      t.text :comments

      t.timestamps
    end
  end
end
