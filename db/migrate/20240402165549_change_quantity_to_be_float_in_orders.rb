class ChangeQuantityToBeFloatInOrders < ActiveRecord::Migration[7.0]
  def change
    change_column :orders, :quantity, :float
  end
end
