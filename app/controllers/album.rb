get '/albums/all' do
  @albums = Album.order('created_at DESC')
  erb :all_albums
end

get "/users/:user_id/albums" do
  erb :user_albums
end

get '/albums/:album_id' do
  @album = Album.find_by_id(params[:album_id])
  erb :single_album
end

get '/photos/all' do
  @photos = Photo.order('created DESC')
  erb :all_photos
end

get '/photos/:photo_id' do
  @photo = Photo.find_by_id(params[:photo_id])
  erb :single_photo
end

get '/upload/:album_id' do
  @album = Album.find_by_id(params[:album_id])
  erb :upload
end

post '/add_photo' do
  # p params.inspect
  photo = Photo.create(params[:post])
  redirect "/upload/#{params[:post][:album_id]}"
end

get '/carousel/:album_id' do
  @album = Album.find_by_id(params[:album_id])
  erb :carousel
end


# get '/photos/:photo_id/delete' do
#   @photo = Photo.find_by_id(params[:photo_id])
#   erb :delete_photo
# end

# post '/photo_delete/:photo_id' do
#   @photo = Photo.find_by_id(params[:photo_id])
#   @album = Album.find_by_id(@photo.album_id)
#   @photo.destroy
#   erb :single_album

# end
