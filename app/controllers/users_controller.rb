get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user]) # name, email, password
  if @user.save
    session[:user_id] = @user.id
    redirect '/channels'
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
  # Subscription.where("channel_id=? and user_id=?", params[:channel_id], params[:user_id]).destroy
  @user = User.find_by(id: params[:user_id])
  @user.subscriptions.find_by(channel_id: params[:channel_id]).destroy
  redirect back
end
