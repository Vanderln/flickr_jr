get '/all_albums' do
  album = Album.all
  erb :all_albums, :locals => {:albums => album}
end

get '/users/:user_id/albums' do
  user = User.find(session[:user_id])
  albums = Album.where(:user_id => user.id)
  erb :user_albums, :locals => {:user => user, :albums => albums}
end

get '/user/:id/albums/photos/:photo_id' do
  user = User.find(current_user.id)
  photo = Photo.find(params[:photo_id])
  erb :single_photo, :locals => {:user => user, :photo => photo}
end

get '/user/:id/albums/:album_id' do
  user = User.find(session[:user_id])
  album = Album.find_by_id(params[:album_id])
  
  erb :single_album, :locals => {:album => album, :user => user}
end

get '/logout' do
  session[:user_id] = nil
  erb :index
end

get '/user/:id/albums/:album_id/add_album' do
  album = Album.find_by_id(params[:album_id])
  erb :add_albums, :locals => {:album => album} 
end

post '/user/:id/new_album' do
  album = Album.create(:title => params[:title], :user_id => current_user.id)
  # p album.id.inspect
  # album.save
    erb :add_photos, :locals => {:album => album} 
  # else
  #   erb
  # end
end

post "/user/:id/albums/:id/add_photo" do


end 

