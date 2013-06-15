get '/logout' do
  session.clear
  redirect '/'
end

get '/create_account' do
  erb :create_account
end

get '/login' do
  erb :login
end

post '/login' do
  # p params.inspect
  username = params[:username]
  password = params[:password]
  @user = User.authenticate(username, password)
  if @user
    session[:user_id] = @user.id
    redirect "/users/#{current_user.id}/albums"
  else
    redirect '/'
  end
end

post '/create_account' do
  user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
  if user.save
    session[:user_id] = user.id
    Album.create(:user_id => user.id, :title => "My first Flickr Album")
    redirect "/users/#{user.id}/albums"
  else 
    erb :index
  end 
end 

post '/login_guest' do
  user = User.find_by_username('guest')
  session[:user_id] = user.id
  redirect '/albums/all'
end
