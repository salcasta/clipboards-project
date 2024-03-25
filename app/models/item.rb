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
end
