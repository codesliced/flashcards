require 'csv'

files = ["drivered.csv", "movies.csv", "pop_music.csv", "videogames.csv"]

files.each do |file|
  CSV.foreach(File.expand_path("db/csv/#{file}"), 'r') do |line|
    begin
      puts line
    rescue
      puts "problem"
    end
  end
end
