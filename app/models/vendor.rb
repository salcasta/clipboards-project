# == Schema Information
#
# Table name: vendors
#
#  id               :integer          not null, primary key
#  company_name     :string
#  rep_email        :string
#  rep_name         :string
#  rep_phone_number :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer
#
class Vendor < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  has_many  :items, class_name: "Item", foreign_key: "vendor_id", dependent: :nullify
end
