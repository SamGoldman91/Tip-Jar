# == Schema Information
#
# Table name: tip_ratings
#
#  id           :integer          not null, primary key
#  rating_value :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  tip_id       :integer
#  user_id      :integer
#
class TipRating < ApplicationRecord
end
