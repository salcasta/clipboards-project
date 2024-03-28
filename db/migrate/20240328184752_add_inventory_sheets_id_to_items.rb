class AddInventorySheetsIdToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :inventory_sheets_id, :integer
  end
end
