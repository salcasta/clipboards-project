class ChangePackCostToBeFloatInItems < ActiveRecord::Migration[7.0]
  def change
    change_column :items, :pack_cost, :float
  end
end
