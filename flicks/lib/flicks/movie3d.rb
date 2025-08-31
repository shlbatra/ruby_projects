require_relative "movie"


module Flicks
  class Movie3D < Movie # Inherit all instance variables and methods

  def initialize(title, rank, wow_factor)
    super(title, rank)
    @wow_factor = wow_factor
  end

  def show_effect
    wow_factor = 10
    puts "Wow! "* wow_factor
  end

  def thumbs_up # override method
    #wow_factor = 10
    # @rank += (1 * @wow_factor)
    @wow_factor.times { super } # calls increment 10 times
  end

  end
end

if __FILE__ == $0

  movie3d = Flicks::Movie3D.new("godzilla", 7, 10)
  movie = Flicks::Movie.new("goonies", 10)

  puts movie3d.title
  puts movie3d.rank

  movie3d.thumbs_up

  puts movie3d.rank

  puts movie3d.show_effect

  puts Flicks::Movie3D.superclass
  p Flicks::Movie3D.ancestors
end