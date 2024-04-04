class RemoveItemsCountFromInventorysheet < ActiveRecord::Migration[7.0]
  def change
    remove_column :inventorysheets, :items_count, :integer
  end
end
