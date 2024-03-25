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
end
