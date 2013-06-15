get '/' do
  @all_photos = Photo.all
  erb :index
end

get '/upload' do
  erb :upload
end



