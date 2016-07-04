require 'faker'


100.times do |i|
  User.create username: "#{Faker::Internet.user_name}", photo_url: "#{Faker::Avatar.image(i+1, "300x300")}", password: "test"
end
