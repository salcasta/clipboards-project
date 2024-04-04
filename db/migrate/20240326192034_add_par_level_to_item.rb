class AddParLevelToItem < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :par_level, :integer
  end
end
