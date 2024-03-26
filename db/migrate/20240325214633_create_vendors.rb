class CreateVendors < ActiveRecord::Migration[7.0]
  def change
    create_table :vendors do |t|
      t.string :company_name
      t.string :rep_name
      t.string :rep_email
      t.string :rep_phone_number
      t.integer :items_count

      t.timestamps
    end
  end
end
