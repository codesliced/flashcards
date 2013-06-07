get '/' do
  if current_user
    redirect to '/available_decks'
  else
    redirect to '/login'
  end
end

get '/available_decks' do
  @decks = Deck.get_all_decks
erb :am_test
end
