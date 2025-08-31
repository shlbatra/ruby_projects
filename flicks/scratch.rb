module Rankable
  def thumbs_up
    @rank += 1
    puts "#{@title} got a thumbs up:#{@rank}"
  end
end

class Movie
  include Rankable

  def initialize(title, rank)
    @title = title
    @rank = rank
  end
end

class Song
  include Rankable

  def initialize(title, rank)
    @title = title
    @rank = rank
  end
end

movie = Movie.new("goonies", 10)
song = Song.new("Jingle Bells", 8)

movie.thumbs_up
song.thumbs_up

p Movie.ancestors
p Song.ancestors

# Mixin 
# First look in object class, then module included in object class, then in super class

p Array.ancestors # Enumerable shared across classes array and hash, similar Kernel mixin shared across Object
p Hash.ancestors