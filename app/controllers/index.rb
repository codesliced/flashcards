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

get '/game/:deck_id' do
  @deck = Deck.find_by_id(params[:deck_id])
  current_card = params[:card_id].to_i
  @cards = (Card.get_cards_by_deck(@deck.id))[current_card]
  erb :game
end

# post '/submit_answer' do
#   guess = params[:guess]
#   Guess.enter_answer(guess)
# end
