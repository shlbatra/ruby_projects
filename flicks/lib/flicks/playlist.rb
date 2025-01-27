require_relative "snackbar"

class Playlist # Objects Colaborating

  attr_reader :name, :movies
  def initialize(name)
    @name = name
    @movies = []
  end

  def roll_die
    rand(1..6)
  end
  def add_movie(movie)
    @movies << movie
  end

  def play(viewings=3)
    puts "\n#{@name}'s playlist"
    puts self.inspect

    puts "\nThe snackbar has:"
    Snackbar::SNACKS.each do |snack|
      puts "#{snack.name} for $#{snack.price}"
    end

    puts "\nBefore watching:"
    puts @movies
    puts "\n"


    1.upto(viewings) do |viewing_number|
      puts "\nViewing #{viewing_number}:"
      @movies.each do |movie|
        number_rolled = roll_die # implicit receiver self.roll_die -> still playlist object
        case number_rolled
        when 1..2
          movie.thumbs_down
          puts "#{movie.title} got a thumbs down"
        when 3..4
          puts "#{movie.title} got skipped"
        else
          movie.thumbs_up
          puts "#{movie.title} got thumbs up"
        end
        snack = Snackbar.random_sample
        puts "During #{movie.title}, #{@name} ate #{snack.name} for $#{snack.price}."
      end
    end

    puts "\nAfter watching:"
    puts @movies
  end
end