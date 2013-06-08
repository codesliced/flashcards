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

get '/game/:round_id/:deck_id' do
  @deck = Deck.find_by_id(params[:deck_id])
  @current_card = params[:card_id].to_i
  @card = (Card.get_cards_by_deck(@deck.id))[@current_card]
  @game_over = @current_card >= (@deck.cards.count - 1)
  @card_side = params[:card_side]
  @round_id = params[:round_id]
  erb :card
end

post '/new_card/:answer' do
  answer = params[:answer]
  route = params[:route]

  redirect to route
end

get '/user/:id' do

erb :user_profile
end


get '/initiate_new_game' do
  round = Round.create(:deck_id => params[:id])

  redirect to "/game/#{round.id}/#{params[:id]}"
end

# post '/submit_answer' do
#   guess = params[:guess]
#   Guess.enter_answer(guess)
# end


