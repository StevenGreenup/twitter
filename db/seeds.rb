require 'faker'
User.delete_all
Tweet.delete_all

100.times do |i|
  User.create username: "#{Faker::Internet.user_name}", photo_url: "#{Faker::Avatar.image(i+1, "300x300")}", password: "test"
end

100.times do |i|
  Tweet.create user_id: "#{i+1}", body: "#{Faker::Hipster.paragraph(i+1)}"
end
