# == Schema Information
#
# Table name: items
#
#  id           :integer          not null, primary key
#  area         :string
#  category     :string
#  comment      :text
#  item_size    :string
#  label        :string
#  pack_cost    :integer
#  pack_size    :integer
#  par_level    :integer
#  price        :integer
#  product_type :string
#  rank         :integer
#  unit         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#  vendor_id    :integer
#
class Item < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: "user_id"
  has_many  :orders, class_name: "Order", foreign_key: "item_id", dependent: :nullify
  belongs_to :vendor, class_name: "Vendor", foreign_key: "vendor_id", optional: true
end
