class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |c|
      c.integer :deck_id
      c.string :front
      c.string :back
      c.timestamps
    end
  end
end
