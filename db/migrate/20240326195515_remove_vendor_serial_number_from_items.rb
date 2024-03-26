class RemoveVendorSerialNumberFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :vendor_serial_number, :string
  end
end
