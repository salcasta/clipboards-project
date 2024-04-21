# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  general_manager_name   :string
#  organization_name      :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many  :items, class_name: "Item", foreign_key: "user_id", dependent: :destroy
  has_many  :inventorysheets, class_name: "Inventorysheet", foreign_key: "user_id", dependent: :destroy
  has_many  :clipboards, class_name: "Clipboard", foreign_key: "user_id", dependent: :destroy
  has_many  :vendors, class_name: "Vendor", foreign_key: "user_id", dependent: :destroy
  has_many  :orders, class_name: "Order", foreign_key: "user_id", dependent: :destroy

end
