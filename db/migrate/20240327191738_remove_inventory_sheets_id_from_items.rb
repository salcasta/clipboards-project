class RemoveInventorySheetsIdFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :inventory_sheets_id, :integer
  end
end
