class CreateInventorysheets < ActiveRecord::Migration[7.0]
  def change
    create_table :inventorysheets do |t|
      t.date :date
      t.boolean :is_holiday
      t.boolean :is_complete
      t.integer :user_id
      t.integer :clipboard_id
      t.integer :items_count
      t.integer :orders_count

      t.timestamps
    end
  end
end
