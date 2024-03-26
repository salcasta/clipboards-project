# == Schema Information
#
# Table name: orders
#
#  id                  :integer          not null, primary key
#  on_hand             :integer
#  quantity            :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  inventory_sheets_id :integer
#  item_id             :integer
#
class Order < ApplicationRecord
  belongs_to :item, required: true, class_name: "Item", foreign_key: "item_id"
  belongs_to :inventory_sheets, required: true, class_name: "Inventorysheet", foreign_key: "inventory_sheets_id", counter_cache: true
end
