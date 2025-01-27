require_relative("treasure_trove")

class Game

  attr_reader :name, :players

  def initialize(name)
    @name = name
    @players = []
  end

  def roll_die
    rand(1..6)
  end

  def add_player(player)
    @players << player
  end

  def play(rounds=3)
    puts "\nBefore Playing:"
    puts @players
    puts "\n"

    TreasureTrove::TREASURES.each do |treasure|
      puts "A #{treasure.name} is worth #{treasure.points} points"
    end

    1.upto(rounds) do |round_number|
      puts "\Round #{round_number}:"
      @players.each do |player|
        number_rolled = roll_die
        case number_rolled
        when 1..2
          player.drain
          puts "#{player.name} got drained"
        when 3..4
          puts "#{player.name} got skipped"
        else
          player.boost
          puts "#{player.name} got boosted"
        end
        treasure = TreasureTrove.random_treasure
        puts "#{player.name} found a #{treasure.name} worth #{treasure.points}"
      end
    end

    puts "\nAfter Playing:"
    puts @players
  end
end