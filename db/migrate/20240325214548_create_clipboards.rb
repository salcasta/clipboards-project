class CreateClipboards < ActiveRecord::Migration[7.0]
  def change
    create_table :clipboards do |t|
      t.string :area
      t.integer :user_id

      t.timestamps
    end
  end
end
