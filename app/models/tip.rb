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
end
