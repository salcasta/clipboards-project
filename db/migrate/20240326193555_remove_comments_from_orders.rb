class RemoveCommentsFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :comments, :text
  end
end
