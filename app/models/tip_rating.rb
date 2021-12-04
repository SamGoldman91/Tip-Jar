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

  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })

  belongs_to(:tip, { :required => true, :class_name => "Tip", :foreign_key => "tip_id" })
  
end
