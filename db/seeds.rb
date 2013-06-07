require 'csv'

files = ["drivered", "movies", "pop_music", "videogames"]

files.each do |file|
  CSV.foreach(File.expand_path("db/csv/#{file}.csv"), 'r') do |line|
    begin
      Card.new
    rescue
      puts "problem"
    end
  end
end
