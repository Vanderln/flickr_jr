get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/user/login' do
  if guest?
    session[:user_id] = 999999
    albums = Album.all
    erb :all_albums, :locals => {:albums => albums} 
  else
    user = User.find_by_username(params[:username])
    
    if user
      session[:user_id] = user.id
      user.save
      redirect to "/users/#{user.id}/albums" 
    else
      user = User.create(:username => params[:username], :password => params[:password])
      Album.create(:title => "Your first Flickr Jr", :user_id => user.id)
      session[:user_id] = user.id
      redirect to "/users/#{user.id}/albums" 
    end
  end
end


def guest?
  params[:guest_login] == "Login as a guest"
end




