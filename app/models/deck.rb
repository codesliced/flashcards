class Deck < ActiveRecord::Base
  has_many :cards
  has_many :rounds

  def self.get_all_decks
    self.all
  end

end
