# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  name            :string
#  password_digest :string
#  photo           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  validates(:name, { :presence => true })

  has_many(:suggestions, { :class_name => "Tip", :foreign_key => "user_id", :dependent => :destroy })

  has_many(:votes, { :class_name => "Vote", :foreign_key => "user_id", :dependent => :destroy })

  has_many(:comments, { :class_name => "Comment", :foreign_key => "user_id", :dependent => :destroy })

  has_many(:ratings, { :class_name => "TipRating", :foreign_key => "user_id", :dependent => :destroy })
end
