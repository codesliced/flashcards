post '/create_user' do
  new_user = User.create(params[:user])
  session[:user_id] = new_user.id
  redirect '/'

end

get '/login' do
  erb :login
end

post '/login' do
  @user = User.authenticate(params[:user])
  if @user
     session[:user_id] = @user.id
    redirect to '/'
  else
    redirect to '/'
  end
end


get '/logout' do
  session[:user_id] = nil
  redirect to '/'
end
