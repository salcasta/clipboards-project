# == Schema Information
#
# Table name: orders
#
#  id                  :integer          not null, primary key
#  comments            :text
#  on_hand             :integer
#  par_level           :integer
#  quantity            :integer
#  rank                :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  inventory_sheets_id :integer
#  item_id             :integer
#
class Order < ApplicationRecord
end
