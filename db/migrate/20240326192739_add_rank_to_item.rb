class AddRankToItem < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :rank, :integer
  end
end
