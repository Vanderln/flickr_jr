require "faker"


4.times do
  User.create(:username => Faker::Name.name, 
          :password => 'asdfgh')
end

6.times do
  Album.create(:title => Faker::Lorem.word, :user_id => 1 + rand(4))
end

# 120.times do
#   Photo.create(:caption => Faker::Lorem.word, :user_id => 1 + rand(4), :album_id => 1 + rand(15))
# end
