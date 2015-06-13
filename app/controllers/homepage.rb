
get '/' do
  if session[:user_id]
    p "[LOG] you've routed to homepage view "
    erb :"/homepage/homepage"
  else
    p "[LOG] you've routed to sigup view"
    erb :'homepage/login_signup'
  end
end

post '/login' do
  p "[LOG] you've routed to homepage view"


end

post '/signup' do
  p "[LOG] you've routed to the SIGNUP post route"
  if params[:password] == params[:verify_password]
    p "[LOG] passwords match"
    new_user = User.new(username: params[:username], password_hash: params[:password])
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


post '/notes' do
  p "[LOG] you've reached POST /notes "
  p "[LOG] your params are: #{params.inspect}"
  new_note = Note.new(message: params[:message])
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
