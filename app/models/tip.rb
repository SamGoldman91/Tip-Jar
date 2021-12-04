# == Schema Information
#
# Table name: tips
#
#  id             :integer          not null, primary key
#  downvote_count :string
#  tip_pic        :string
#  tip_text       :string
#  tip_type       :string
#  upvote_count   :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  business_id    :integer
#  user_id        :integer
#
class Tip < ApplicationRecord

  validates(:tip_text, { :presence => true })
  
  validates(:business_id, { :presence => true })

  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })

  belongs_to(:business, { :required => true, :class_name => "Business", :foreign_key => "business_id" })

  has_many(:votes, { :class_name => "Vote", :foreign_key => "tip_id", :dependent => :destroy })

  has_many(:comments, { :class_name => "Comment", :foreign_key => "tip_id", :dependent => :destroy })

  has_many(:ratings, { :class_name => "TipRating", :foreign_key => "tip_id", :dependent => :destroy })

end
