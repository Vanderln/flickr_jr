User.create(:username => 'guest', :email => 'nothing@nothing.com', :password => 'password')


4.times do
  User.create(:username => Faker::Internet.user_name, :email => Faker::Internet.email, 
          :password => 'password')
end

6.times do
  Album.create(:title => Faker::Lorem.word, :user_id => 1 + rand(4))
end

120.times do
  Photo.create(:description => Faker::Lorem.word, :user_id => 1 + rand(4), 
               :album_id => 1 + rand(6), :file => 'hi.jpg')
end
