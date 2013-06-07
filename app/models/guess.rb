class Guess < ActiveRecord::Base
  belongs_to :round

  def self.enter_answer
    # guess = params[:guess]
  end
end
