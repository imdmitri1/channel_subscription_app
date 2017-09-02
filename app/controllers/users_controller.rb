get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user]) # name, email, password
  if @user.save
    session[:user_id] = @user.id
    redirect '/index'
  else
    status 422
    erb :'users/new'
  end
end

get '/users/:user_id' do
  authenticate!
  @user = User.find_by(id: params[:user_id])
  erb :'users/show'
end

post '/users/:user_id/:channel_id' do
  authenticate!
  @user = User.find_by(id: params[:user_id])
  @user.channels << Channel.find_by(id: params[:channel_id])
  redirect back
end

delete '/users/:user_id/:channel_id' do
  authenticate!
  @user = User.find_by(id: params[:user_id])
  redirect back
end
