desc "Fill the database tables with some sample data"
task({ :sample_data => :environment}) do
  require 'faker'

  # User.destroy_all
  # Business.destroy_all
  # Tip.destroy_all

  # 10.times do |user|
  #  u = User.new
  #  u.email = "user_#{user}@example.com"
  #  u.password = "password"
  #  u.name = Faker::FunnyName.name
  #  u.save
  # end
  
  # 10.times do |biz|
  #  b = Business.new
  #  b.business_name = Faker::Restaurant.name
  #  b.business_description = Faker::Restaurant.description
  #  b.address = Faker::Address.full_address
  #  b.save
  # end

  # 10.times do |tip|
  #  t = Tip.new
  #  t.title = "Tip ##{tip}"
  #  t.tip_type = "Category #{tip}"
  #  t.tip_text = Faker::Lorem.paragraphs
  #  t.tip_pic = Faker::LoremFlickr.image(size: "50x60", search_terms: ['restaurants'])
  #  t.business_id = tip
  #  t.user_id = tip+1
  #  t.save
  # end
  
  # p "Added sample users, businesses, and tips!"
end
