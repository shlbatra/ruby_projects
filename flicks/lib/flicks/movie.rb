class Movie

  attr_reader :title, :rank, :snacks_eaten # instance method title, :title is symbol - one value / object - immutable string
  attr_writer :title # attr_accessor for both read and write

  def initialize(title, rank=5)
    @title = title.capitalize
    @rank = rank
    @snacks_eaten = Hash.new(0)
  end

  # def title # Reader or getter method
  #   return @title
  # end
  # 
  # def title=(new_title) # writer or setter method
  #   @title=new_title
  # end

  def to_s() = "#{@title} has a rank of #{@rank}" # endless methods

  def to_csv
    "#{@titile},#{@rank}"
  end

  def self.from_csv(line)  # return class object so need a class method so add self prior to method name
    title, rank = line.split(",")
    Movie.new(title, Integer(rank))  # raise exception if rank is not integer
  rescue ArgumentError
    puts "Ignored invalid rank: #{rank}"
    Movie.new(title)
  end

  def thumbs_up
    @rank += 1
  end

  def thumbs_down
    @rank -= 1
  end

  def add_snack(name, price)
    @snacks_eaten[name] += price
  end

  def total_snack_price
    @snacks_eaten.values.sum
  end

end

if __FILE__ == $0
  movie = Movie.new("Star Wars", 9)
  puts movie
end