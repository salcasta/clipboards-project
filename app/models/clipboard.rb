# == Schema Information
#
# Table name: clipboards
#
#  id         :integer          not null, primary key
#  area       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Clipboard < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  has_many  :inventorysheets, class_name: "Inventorysheet", dependent: :destroy
  has_many  :items, class_name: "Item", dependent: :nullify
end
