get '/' do
  if session[:user_id]
    p "[LOG] you've routed to homepage view "
    @current_user = User.find(session[:user_id])
    erb :"/homepage/homepage"
  else
    p "[LOG] you've routed to sigup view"
    erb :'homepage/login_signup'
  end
end

post '/login' do
  p "[LOG] you've routed to homepage view"
  if @user = User.authenticate(params[:username], params[:password])
    session[:user_id] = @user.id
    p "[LOG] Authentication succeeded"
    redirect '/'
  else
    p "[LOG] Authentication failed"
    redirect '/'
  end
end

post '/signup' do
  p "[LOG] you've routed to the SIGNUP post route"
  if params[:password] == params[:verify_password]
    p "[LOG] passwords match"
    new_user = User.new(username: params[:username], password: params[:password])
    if new_user.save
      p "[LOG] User saved"
      session[:user_id] = new_user.id
      redirect '/'
    end
  else
    p "[LOG] User not saved"
    @errors = ["Be sure to fill in all the fields and match the passwords"]
    erb :"homepage/login_signup"
  end
end


get '/:user_profile' do
  @current_user = User.find(params[:user_profile])
  p "[LOG] routed to /:user_profile"
  if @current_user && @current_user.id == session[:user_id]
    p "[LOG] user verifed as logged in user"
    @notes = @current_user.notes
    erb :"profile/user_profile"
  else
    p "[LOG] user not authenticated to view profile"
  end
end

post '/notes' do
  p "[LOG] you've reached POST /notes "
  p "[LOG] your params are: #{params.inspect}"
  new_note = Note.new(message: params[:message], user_id: session[:user_id])
  new_address = Receiver.new(params[:address])
  if new_note.save && new_address.save
    p "[LOG] Note and address saved"
    redirect "notes/#{new_note.id}"
  else
    p "[LOG] Note and address NOT saved"
  end
end

get '/notes/:id' do
  p "[LOG] you've reached /notes/:id"
  p "[LOG] your params are: #{params.inspect}"
  @note = Note.find(params[:id])
  erb :"note/note_confirmation"
end


delete '/delete/:note_id' do
  p "[LOG] hit delete route"
  p params.inspect
  note = Note.find(params[:note_id])
  note.destroy
  p "[LOG] exiting delete route"
  redirect "/#{session[:user_id]}"
end





