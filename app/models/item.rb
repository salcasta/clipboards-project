# == Schema Information
#
# Table name: items
#
#  id                   :integer          not null, primary key
#  area                 :string
#  category             :string
#  item_size            :string
#  label                :string
#  pack_cost            :integer
#  pack_size            :integer
#  price                :integer
#  product_type         :string
#  unit                 :string
#  vendor_serial_number :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  inventory_sheets_id  :integer
#  user_id              :integer
#  vendor_id            :integer
#
class Item < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: "user_id"
  has_many  :orders, class_name: "Order", foreign_key: "item_id", dependent: :nullify
  belongs_to :inventory_sheets, class_name: "Inventorysheet", foreign_key: "inventory_sheets_id", optional: true
  belongs_to :vendor, class_name: "Vendor", foreign_key: "vendor_id", optional: true
end
