class AddUserIdToVendors < ActiveRecord::Migration[7.0]
  def change
    add_column :vendors, :user_id, :integer
  end
end
