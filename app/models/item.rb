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
#  pack_cost           :float
#  pack_size           :float
#  par_level           :integer
#  price               :float
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
  before_save :adjust_ranks, if: :rank_changed?
  before_save :calculate_pack_cost

  belongs_to :user, class_name: "User", foreign_key: "user_id"
  has_many  :orders, class_name: "Order", foreign_key: "item_id", dependent: :destroy
  belongs_to :vendor, class_name: "Vendor", foreign_key: "vendor_id", optional: true
  belongs_to :clipboard, class_name: "Clipboard", foreign_key: "clipboard_id", optional: true
  has_many :clipboards, through: :inventory_sheets

  def adjust_ranks
    if Item.where(rank: self.rank).exists?
      Item.where("rank >= ?", self.rank).update_all("rank = rank + 1")
    end
  end
  
  private

  def calculate_pack_cost
    self.pack_cost = self.price * self.pack_size
  end
end
