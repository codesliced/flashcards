class Card < ActiveRecord::Base
  belongs_to :deck

  def self.get_cards_by_deck(deck_id)
    self.where("deck_id = #{deck_id}")
  end
end
