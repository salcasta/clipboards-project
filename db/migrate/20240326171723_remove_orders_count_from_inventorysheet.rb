class RemoveOrdersCountFromInventorysheet < ActiveRecord::Migration[7.0]
  def change
    remove_column :inventorysheets, :orders_count, :integer
  end
end
