
get '/' do
  erb :"/homepage/homepage"
end


post '/notes' do
  p "[LOG] you've reached POST /notes "
  p "[LOG] your params are: #{params.inspect}"
  p params[:message].chomp
end

