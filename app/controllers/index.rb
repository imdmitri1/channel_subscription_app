get '/' do

  erb :index
end


get '/index' do
  # if current_user?
    # erb :index
  # else
  #   redirect '/sessions/new'
  # end
  redirect '/'
end
