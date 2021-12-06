desc "Fill the database tables with some sample data"
task({ :sample_data => :environment}) do
  require 'faker'

  #User.destroy_all
  #Business.destroy_all
  #Tip.destroy_all

  #10.times do |user|
  #  u = User.new
  #  u.email = "user_#{user}@example.com"
  #  u.password = "password"
  #  u.name = Faker::Name.name
  #  u.save
  #end
  
  #10.times do |biz|
  #  b = Business.new
  #  b.business_name = Faker::Company.name
  #  b.address = Faker::Address.full_address
  #  b.save
  #end

  10.times do |tip|
   t = Tip.new
   t.tip_type = "Category #{tip}"
   t.tip_text = "Sample tip text #{tip}"
   t.tip_pic = "https://robohash.org/2Z9.png?set=set1&size=150x150"
   t.business_id = tip+11
   t.user_id = tip+11
   t.save
  end
  
  p "Added sample users, businesses, and tips!"
end
