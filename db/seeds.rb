# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

user = User.new(
   :full_name => "Admin pass(administrator)",
   :email => "admin@email.com",
   :password => "administrator",
   :password_confirmation => "administrator"
 )

raise user.errors.full_messages unless user.save
25.times do |num|
 user = User.create(
    :full_name => Faker::Name.name + "#{num}",
    :email => Faker::Internet.email,
    :password => "please#{num}",
    :password_confirmation => "please#{num}"
  )

Message.create!(
  :title => Faker::Lorem.sentence(5), 
  :content => Faker::Lorem.paragraph, 
  :user => user,
  :published => [0,1].shuffle.first
)
end
