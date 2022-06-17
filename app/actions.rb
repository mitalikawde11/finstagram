#get '/' do
 #   File.read(File.join('app/views','index.html'))
#end


get '/' do
  @finstagram_posts = FinstagramPost.order(created_at: :desc)  
  erb(:index)
end 

get '/signup' do
  @user = User.new()
  erb(:signup)
end

post '/signup' do
  #grab user input values from params
  email = params[:email]
  avatar_url = params[:avatar_url]
  username = params[:username]
  password = params[:password]

  #instate and save a user
  @user = User.new({email: email, avatar_url: avatar_url, username: username, password: password})
  
  # if user validation pass and user is saved
  if @user.save
    "User #{username} saved!"
    
  else
    erb(:signup)

  end
  
end  


