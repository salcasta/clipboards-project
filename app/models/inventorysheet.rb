# == Schema Information
#
# Table name: inventorysheets
#
#  id           :integer          not null, primary key
#  date         :date
#  is_complete  :boolean
#  is_holiday   :boolean
#  items_count  :integer
#  orders_count :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  clipboard_id :integer
#  user_id      :integer
#
class Inventorysheet < ApplicationRecord
end
