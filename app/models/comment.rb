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
end
