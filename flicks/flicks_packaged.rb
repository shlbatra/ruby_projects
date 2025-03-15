require_relative "lib/flicks/movie"
require_relative "lib/flicks/playlist"
require_relative "lib/flicks/movie3d"

movie1 = Movie.new("goonies", 10)
# puts movie1.inspect
# puts movie1
movie1.thumbs_up
# puts movie1

movie2 = Movie.new("ghostbusters", 9)
# puts movie2.inspect

movie3 = Movie.new("goldfinger")
# puts movie3.inspect
# puts movie3
movie3.thumbs_down
# puts movie3
# puts movie3 # convert to string so class need to define to_s or get default method

# Attr in Attribute

# puts movie1.title
movie1.title = "gonys" # movie1.title=("gonys")
# puts movie1.title


# movies = [movie1, movie2, movie3]

ARGV[0]  # command line args

movies_file = File.join(__dir__, "movies.csv")

playlist_1 = Playlist.new("playlist1")
playlist_1.load(ARGV.shift || movies_file)  # empty args so gets not pick whats in arguments

movie3d = Movie3D.new("godzilla", 7, 10)
playlist_1.add_movie(movie3d)

# movies.each do |movie|
#   playlist_1.add_movie(movie)
# end

loop do

  print "\nHow many viewings? "
  answer = gets.chomp.downcase

  case answer
  when /^\d+$/    # types number
    playlist_1.play(answer.to_i)
  when "quit", "exit"
    playlist_1.print_stats
    break
  else
    puts "Please enter a number or 'quit'"
  end
end

playlist_1.save

# playlist_2 = Playlist.new("playlist2") # Movie3 object shared across 2 objects for playlist class
# playlist_2.add_movie(movie3)
# movie4 = Movie.new("gremlins",9)
# playlist_2.add_movie(movie4)
# playlist_2.play(20) # self references playlist_2 - receiver method call
# playlist_2.print_stats