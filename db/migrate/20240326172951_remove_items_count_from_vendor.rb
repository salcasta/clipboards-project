class RemoveItemsCountFromVendor < ActiveRecord::Migration[7.0]
  def change
    remove_column :vendors, :items_count, :integer
  end
end
