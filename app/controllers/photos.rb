get "/user/:id/albums/:album_id/add_photos" do
  
  album = Album.find_by_id(params[:album_id])


  erb :add_photos, :locals => {:album => album}
end

post "/user/:id/albums/:album_id/add_photo" do
  # puts "\n"*5
  # p url = params[:image] 
  # puts "\n"*5
  photo = Photo.create(:caption => params[:caption], :image => params[:image], 
                    :user_id => current_user.id, :album_id => params[:captures][1].to_i)
  album = Album.find_by_id(params[:album_id])
  erb :add_photos, :locals => {:album => album}
  
end 



post "/user/:id/albums/:album_id/photo_finish" do
  photo = Photo.create(:caption => params[:caption], :image => params[:image], 
                    :user_id => current_user.id, :album_id => params[:captures][1].to_i)
  album = Album.find_by_id(params[:album_id])
  erb :single_album, :locals => {:album => album}

end

get "/user/:id/albums/:album_id/photos/:photo_id" do
  album = Album.find_by_id(params[:album_id])
  photo = Photo.find_by_id(params[:photo_id])
  erb :single_photo, :locals => {:photo => photo, :album => album}
end
