class ChangePackSizeToBeFloatInItems < ActiveRecord::Migration[7.0]
  def change
    change_column :items, :pack_size, :float
  end
end
