class AddClipboardIdToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :clipboard_id, :integer
  end
end
