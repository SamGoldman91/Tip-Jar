# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  vote_type  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tip_id     :integer
#  user_id    :integer
#
class Vote < ApplicationRecord
end
