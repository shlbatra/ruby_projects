require_relative("treasure_trove")
require_relative("auditable")

module StudioGame
  class Game
    include Auditable
    attr_reader :name, :players

    def initialize(name)
      @name = name
      @players = []
    end

    def load_players(from_file)
      File.readlines(from_file, chomp: true).each do |line|
        player = Player.from_csv(line)
        add_player(player)
      end
      rescue Errno::ENOENT
        puts "Whoops, #{from_file} not found!"
        exit 1 
    end


    def high_score_entry(player)
      name = player.name.ljust(20, ".")
      score = player.score.round.to_s.rjust(5)
      "#{name}#{score}"
    end

    def save_high_scores(to_file = "high_scores.txt")
      File.open(to_file, "w") do |file|
        file.puts "#{@title} High Scores:"
        sorted_players.each do |player|
          file.puts high_score_entry(player)
        end
      end
    end

    def roll_die
      number=rand(1..6) # number = [1, 1, 2, 5, 6, 6].sample
      audit(number)
      number
    end

    def add_player(player)
      @players << player
    end

    def sorted_players
      @players.sort_by { |player| player.score }.reverse
    end

    def print_stats
      puts "\n Game Stats:"
      puts "-" * 30

      @players.each do |player|
        puts "\n#{player.name}'s treasure point totals:"
        player.found_treasures.each do |name, points|
          puts "#{name}: #{points}"
        end
        puts "total: #{player.points}"
      end

      sorted_players.each do |player|
        puts high_score_entry(player)
    end

    end

    def play(rounds=3)
      puts "\nBefore Playing:"
      puts @players
      puts "\n"

      puts TreasureTrove.treasure_items

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
          player.found_treasure(treasure.name, treasure.points)
          puts "#{player.name} found a #{treasure.name} worth #{treasure.points}"
        end
      end

      puts "\nAfter Playing:"
      puts @players
    end
  end
end