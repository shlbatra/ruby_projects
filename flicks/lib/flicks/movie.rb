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

if __FILE__ == $0
  movie = Movie.new("Star Wars", 9)
  puts movie
end