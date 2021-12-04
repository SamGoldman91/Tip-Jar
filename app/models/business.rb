# == Schema Information
#
# Table name: businesses
#
#  id            :integer          not null, primary key
#  address       :string
#  business_name :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Business < ApplicationRecord

  validates(:business_name, { :presence => true })

  validates(:address, { :presence => true })
  
  has_many(:tips, { :class_name => "Tip", :foreign_key => "business_id", :dependent => :destroy })

end
