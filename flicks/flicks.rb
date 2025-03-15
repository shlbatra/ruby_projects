puts "Ruby is friendly"

phrase = "Ruby is fun"
puts phrase

title = "Goonies"
rank = 10
puts "#{title} has a rank of #{rank}.\nHe gives it a #{rank}."  # self.puts default self points to current object
puts '#{title} has a rank of #{rank}.\nHe gives it a #{rank}.' # cannot interprolate

# Custom Methods

puts "\n\n Custom Methods \n\n"

def movie_info(title:, rank: title.length) # rank=title.length
  "#{title.capitalize} has a rank of #{rank}" # defaul t last value calculated returned
end

puts movie_info(title: title, rank: rank)
puts movie_info(title: "another movie", rank: 7)
puts movie_info(title: "default movie")

# Classes
puts "\n\n Classes \n\n"

title = String.new("data")

class Movie

  attr_reader :title, :rank # instance method title, :title is symbol - one value / object - immutable string
  attr_writer :title # attr_accessor for both read and write

  def initialize(title, rank=5)
    @title = title.capitalize
    @rank = rank
  end

  # def title # Reader or getter method
  #   return @title
  # end
  # 
  # def title=(new_title) # writer or setter method
  #   @title=new_title
  # end

  def to_s() = "#{@title} has a rank of #{@rank}" # endless methods

  def thumbs_up
    @rank += 1
  end

  def thumbs_down
    @rank -= 1
  end

end


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

# if else condition
number_rolled = rand(1..6)

if number_rolled < 3
  movie1.thumbs_down
  puts "#{movie1.title} got a thumbs down"
elsif number_rolled < 5
  puts "#{movie1.title} got skipped"
else
  movie1.thumbs_up
  puts "#{movie1.title} got thumbs up"
end

# case condition
number_rolled = rand(1..6)

case number_rolled
when 1..2
  movie1.thumbs_down
  puts "#{movie1.title} got a thumbs down"
when 3..4
  puts "#{movie1.title} got skipped"
else
  movie1.thumbs_up
  puts "#{movie1.title} got thumbs up"
end

## Array & Hashes

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

  def play
    puts "\n#{@name}'s playlist"
    puts self.inspect
    puts "\nBefore watching:"
    puts @movies
    puts "\n"

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
    end

    puts "\nAfter watching:"
    puts @movies
  end
end

movies = [movie1, movie2, movie3]
playlist_1 = Playlist.new("playlist1")

movies.each do |movie|
  playlist_1.add_movie(movie)
end

playlist_1.play

playlist_2 = Playlist.new("playlist2") # Movie3 object shared across 2 objects for playlist class
playlist_2.add_movie(movie3)
movie4 = Movie.new("gremlins",9)
playlist_2.add_movie(movie4)
playlist_2.play # self references playlist_2 - receiver method call


# Block - code between do and end - assciated with method
9.times do |episode| # 0...9
  puts "Star Wars: Episode #{episode}"
end

puts "\n\n\n"

1.upto(9) {|episode| puts "Star Wars: Episode #{episode}"} #  print 1..9 

puts "\n\n\n"

3.downto(1) do |number|
  puts "launch in #{number}"
end

puts "\n\n\n"

words = %w[dog zebra elephant chimpanzee]

words.each do |word|
  puts word.length
end

# Struct and Data Values

# Struct - similar to data class

Snack = Struct.new(:name, :price)
Snack.new("popcorn", 3)
s = Snack.new("pretzels", 2)

puts s
puts s.name
puts s.price
s.name = "chips"
# To make struct immutable use data class
 
Snack = Data.define(:name, :price)
k = Snack.new("pretzels", 2)


# Hashes

snacks_eaten = {}
if snacks_eaten.has_key?("a")
  snacks_eaten["a"]+=1
else
  snacks_eaten["a"]=1
end

puts snacks_eaten

snacks_eaten1 = Hash.new(0) # by default, all new keys assigned 0
snacks_eaten1["a"] += 1

puts snacks_eaten1

require_relative("lib/flicks/movie")

movie_1 = Movie.new("aa", 10)
movie_2 = Movie.new("b", 9)
movie_3 = Movie.new("c")

movies = [movie_1, movie_2, movie_3]

hits = []
movies.each do |movie|
  if movie.rank >= 7
    hits << movie
  end
end
puts hits

hits = movies.select { |movie| movie.rank >= 7 }
p hits
flops = movies.reject { |movie| movie.rank >= 7 }
p flops
hits, flops = movies.partition { |movie| movie.rank >= 7 } # cond true, cond false
p hits
p flops

titles = []
# movies.each do |movie|
#   titles << movie.title
# end
#Shortcut of above
title = movies.map  { |movie| movie .title } # return array of same size
p title

p movies.map  { |movie| movie.title.length } 

sorted = movies.sort_by { |movie| movie.rank }.reverse
p sorted

# Read file

File.open("movies.csv") do |file|
  file.each_line do |line|
    p line
  end
end

# Alternate
File.readlines("movies.csv", chomp: true).each do |line|
  title, rank = line.split(",")
  p title
  p rank
end

# Mixin 

p Array.ancestors # Enumerable shared across classes array and hash, similar Kernel mixin shared across Object
p Hash.ancestors