class Player

  attr_reader :health, :name
  # attr_accessor :name
  
  def name=(new_name)
    @name = new_name.capitalize
  end

  def score
    return @health + @name.length
  end

  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
  end

  def to_s() 
    "I am #{@name.capitalize.strip} with a health of #{@health} and score of #{score}" # endless method
  end

  def boost()
    @health += 15
  end

  def drain()
    @health -= 10
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