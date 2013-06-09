require 'csv'

files = ["faces", "game_of_thrones", "star_wars", "urban_dictionary"]

files.each do |file|
  current_deck = Deck.find_or_create_by_name(file)
  CSV.foreach(File.expand_path("db/csv/#{file}.csv"), {:col_sep => "--&&--"}) do |line|
    begin
      current_deck.cards << Card.create(front: line[0], back: line[1])
    rescue
      puts "problem"
    end
  end
end
