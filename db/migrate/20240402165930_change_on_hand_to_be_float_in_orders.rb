class ChangeOnHandToBeFloatInOrders < ActiveRecord::Migration[7.0]
  def change
    change_column :orders, :on_hand, :float
  end
end
