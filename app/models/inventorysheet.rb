# == Schema Information
#
# Table name: inventorysheets
#
#  id           :integer          not null, primary key
#  date         :date
#  is_complete  :boolean
#  is_holiday   :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  clipboard_id :integer
#  user_id      :integer
#
class Inventorysheet < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  has_many  :orders, class_name: "Order", foreign_key: "inventory_sheets_id", dependent: :destroy
  belongs_to :clipboard, required: true, class_name: "Clipboard", foreign_key: "clipboard_id"
end
