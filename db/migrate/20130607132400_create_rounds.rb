class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |r|
      r.integer :deck_id
      r.timestamps
    end
  end
end
