get '/:birthdate' do
  setup_index_view
end

get '/message/:birth_path_num' do
  birth_path_num = params[:birth_path_num].to_i
  @message = Person.get_message(birth_path_num)
  erb :index
end

get '/' do
  erb :form
end

post '/' do
  birthdate = params[:birthdate].gsub("-", "")

  if Person.valid_birthdate(birthdate)
    birth_path_num = Person.get_birth_path_num(birthdate)
    redirect "/message/#{birth_path_num}"
  else
    @error = "Uh Oh! You may not pay attention to instructions well? Let's try this again. Enter a valid birthdate in the form of mmddyyyy."
    erb :form    
  end
end

def setup_index_view
	birthdate = params[:birthdate]
	birth_path_num = Person.get_birth_path_num(birthdate)
	@message = Person.get_message(birth_path_num)
  erb :index
end
