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

  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })

  belongs_to(:tip, { :required => true, :class_name => "Tip", :foreign_key => "tip_id" })

  validates(:tip_id, uniqueness: {scope: :user_id, message: "Can only vote once" })
end
