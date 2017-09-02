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

get '/users/:user_id/channels' do
  authenticate!
  @user = User.find_by(id: params[:user_id])
  erb :'users/show'
end
