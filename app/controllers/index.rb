 get '/' do
  if current_user
    redirect to '/available_decks'
  else
    redirect to '/login'
  end
end


get '/available_decks' do
  @decks = Deck.get_all_decks
erb :all_decks
end

get '/game/:round_id/:deck_id' do
  @deck = Deck.find_by_id(params[:deck_id])
  @current_card = params[:card_id].to_i
  @card = (Card.get_cards_by_deck(@deck.id))[@current_card]
  @game_over = @current_card >= (@deck.cards.count - 1)
  @card_side = params[:card_side]
  # @round_id = params[:round_id]
  erb :card, :locals => {:round_id => params[:round_id]}
end

post '/new_card/:answer' do
  answer = params[:answer]
  route = params[:route]
  round_id = params[:round_id]
  Guess.create(:answer => answer, :round_id => round_id)
  redirect to route
end

get '/user/:user_id' do
    user_id = params[:user_id]
    @rounds = User.get_rounds_by_user_id(user_id.to_i)
    
erb :user_profile
end


get '/initiate_new_game' do
  round = Round.create(:deck_id => params[:id], :user_id => params[:user_id])
  redirect to "/game/#{round.id}/#{params[:id]}?card_id=0&card_side=back"
end




