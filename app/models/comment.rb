# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  comment_text :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  tip_id       :integer
#  user_id      :integer
#
class Comment < ApplicationRecord

  validates(:user_id, { :presence => true })

  validates(:tip_id, { :presence => true })

  validates(:comment_text, { :presence => true })
  
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })

  belongs_to(:tip, { :required => true, :class_name => "Tip", :foreign_key => "tip_id" })

end
