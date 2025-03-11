require_relative "snackbar"
require_relative "movie"

class Playlist # Objects Colaborating

  attr_reader :name, :movies
  def initialize(name)
    @name = name
    @movies = []
  end

  def roll_die
    rand(1..6)
  end

  def load(from_file)
    File.readlines(from_file, chomp: true).each do |line|
      movie = Movie.from_csv(line)
      add_movie(movie)
    end
    rescue Errno::ENOENT
      puts "Whoops, #{from_file} not found!"
      exit 1  # exit program
  end

  def save(to_file = "movie_rankings.csv")
    File.open(to_file, "w") do |file|
      sorted_movies.each do |movie|
        file.puts movie.to_csv
      end
    end
  end

  def add_movie(movie)
    @movies << movie
  end

  def sorted_movies
    @movies.sort_by { |movie| movie.rank }.reverse
  end

  def print_stats
    puts "\n#{@name}'s Playlist Stats:"
    puts "-" * 30

    puts sorted_movies

    @movies.each do |movie|
      puts "\n#{movie.title} snack totals:"
      movie.snacks_eaten.each do |name, total_price|
        puts "#{name}: $#{total_price}"
      end
      puts "total: $#{movie.total_snack_price}"
    end
  end


  def play(viewings=3)
    # puts "\n#{@name}'s playlist"
    # puts self.inspect

    puts "\nThe snackbar has:"
    # Snackbar::SNACKS.each do |snack|
    #   puts "#{snack.name} for $#{snack.price}"
    # end

    menu_items = Snackbar.menu_items

    puts menu_items

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
        snack = Snackbar.random_snack
        movie.add_snack(snack.name, snack.price)
        puts "During #{movie.title}, #{@name} ate #{snack.name} for $#{snack.price}."
      end
    end

    puts "\nAfter watching:"
    puts @movies
  end
end