# == Schema Information
#
# Table name: items
#
#  id                  :integer          not null, primary key
#  area                :string
#  category            :string
#  comment             :text
#  item_size           :string
#  label               :string
#  pack_cost           :integer
#  pack_size           :integer
#  par_level           :integer
#  price               :integer
#  product_type        :string
#  rank                :integer
#  unit                :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  clipboard_id        :integer
#  inventory_sheets_id :integer
#  user_id             :integer
#  vendor_id           :integer
#
class Item < ApplicationRecord
  before_save :adjust_ranks

  belongs_to :user, class_name: "User", foreign_key: "user_id"
  has_many  :orders, class_name: "Order", foreign_key: "item_id", dependent: :nullify
  belongs_to :vendor, class_name: "Vendor", foreign_key: "vendor_id", optional: true
  belongs_to :clipboard, class_name: "Clipboard", foreign_key: "clipboard_id", optional: true
  has_many  :inventory_sheets, class_name: "Inventorysheet", foreign_key: "item_id", dependent: :nullify
  has_many :clipboards, through: :inventory_sheets

  def adjust_ranks
    if Item.where(rank: self.rank).exists?
      Item.where("rank >= ?", self.rank).update_all("rank = rank + 1")
    end
  end
  
end
