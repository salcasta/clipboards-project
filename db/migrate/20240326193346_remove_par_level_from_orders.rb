class RemoveParLevelFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :par_level, :integer
  end
end
