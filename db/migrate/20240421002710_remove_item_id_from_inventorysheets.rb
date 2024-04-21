class RemoveItemIdFromInventorysheets < ActiveRecord::Migration[7.0]
  def change
    remove_column :inventorysheets, :item_id, :integer
  end
end
