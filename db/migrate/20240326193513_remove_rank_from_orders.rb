class RemoveRankFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :rank, :integer
  end
end
