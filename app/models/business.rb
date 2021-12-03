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
end
