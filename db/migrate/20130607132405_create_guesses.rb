class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |g|
      g.boolean :answer
      g.integer :round_id
      g.timestamps
    end
  end
end
