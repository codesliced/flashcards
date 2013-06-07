post '/create_user' do
  new_user = User.new(params[:user])
  if new_user.save 
    session[:user_id] = new_user.id
    redirect '/'
  else
    @errors = new_user.errors
    erb :login
  end

end

get '/login' do 
  puts request.class
  puts request.inspect
  erb :login
end

post '/login' do
  puts request.inspect
  @user = User.authenticate(params[:user])
  if @user
     session[:user_id] = @user.id
    redirect to '/'
  else
    @errors = { login_error: "Invalid Login"}
    erb :login
  end
end


get '/logout' do
  session[:user_id] = nil
  redirect to '/'
end
