class AddItemIdToInventorysheets < ActiveRecord::Migration[7.0]
  def change
    add_column :inventorysheets, :item_id, :integer
  end
end
