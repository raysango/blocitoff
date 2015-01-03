require 'faker'

#Create Users
5.times do
  user = User.new(
    name:  Faker::Name.name,
    email:  Faker::Internet.email,
    password:  Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save!
end
users=User.all

#Create Lists
 25.times do
  list = List.create!(
    title:  Faker::Lorem.sentence,
    user:  users.sample
    )
 end
lists = List.all

#Create Items
 50.times do
  item = Item.create!(
    name:  Faker::Lorem.sentence,
    list:  lists.sample
    )
end

# Create a default user
raymond = User.new(
  name: "Raymond Morcos",
  email: "remongeorge@live.com",
  password: "password",
  )
raymond.skip_confirmation!
raymond.save!

puts "Seed finished"
 puts "#{User.count} users created" 
puts "#{List.count} lists created"
puts "#{Item.count} items created"
 