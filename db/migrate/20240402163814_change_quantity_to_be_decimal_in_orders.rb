class ChangeQuantityToBeDecimalInOrders < ActiveRecord::Migration[7.0]
  def change
    change_column :orders, :quantity, :decimal
  end
end
