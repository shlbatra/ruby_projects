require_relative "lib/flicks/movie"
require_relative "lib/flicks/playlist"

movie1 = Movie.new("goonies", 10)
puts movie1.inspect
puts movie1
movie1.thumbs_up
puts movie1

movie2 = Movie.new("ghostbusters", 9)
puts movie2.inspect

movie3 = Movie.new("goldfinger")
puts movie3.inspect
puts movie3
movie3.thumbs_down
puts movie3
puts movie3 # convert to string so class need to define to_s or get default method

# Attr in Attribute

puts movie1.title
movie1.title = "gonys" # movie1.title=("gonys")
puts movie1.title


movies = [movie1, movie2, movie3]
playlist_1 = Playlist.new("playlist1")

movies.each do |movie|
  playlist_1.add_movie(movie)
end

playlist_1.play(2)

playlist_2 = Playlist.new("playlist2") # Movie3 object shared across 2 objects for playlist class
playlist_2.add_movie(movie3)
movie4 = Movie.new("gremlins",9)
playlist_2.add_movie(movie4)
playlist_2.play # self references playlist_2 - receiver method call