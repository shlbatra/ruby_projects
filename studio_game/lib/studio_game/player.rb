require_relative "playable"

class Player
  include Playable

  attr_reader :name, :found_treasures
  attr_accessor :health
  # attr_accessor :name
  
  def name=(new_name)
    @name = new_name.capitalize
  end

  def score
    return @health + points
  end

  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
    @found_treasures = Hash.new(0)
  end

  def to_s() 
    "I am #{@name.capitalize.strip} with a health of #{@health}, points of #{points} and score of #{score}" # endless method
  end

  def self.from_csv(line)  # return class object so need a class method so add self prior to method name
    name, health = line.split(",")
    Player.new(name, Integer(health))   # Integer(health) rescue 5 - alternate way
  rescue ArgumentError
    puts "Ignored invalid health: #{health}"
    Player.new(name)
  end

  def found_treasure(name, points)
    @found_treasures[name] += points 
  end

  def points
    @found_treasures.values.sum
  end

end

if __FILE__ == $0
  player = Player.new("jase")
  puts player.name
  puts player.health
  player.boost
  puts player.health
  player.drain
  puts player.health
end