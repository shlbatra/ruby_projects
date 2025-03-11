require_relative "lib/studio_game/game"
require_relative "lib/studio_game/player"

puts "Let's play a game!"
puts "🚀" * 25
puts "\n"
puts "\t3"
puts "\t2"
puts "\t1"

name = "Finn"
health_value = 60
player_1 = Player.new(name, health_value)

# puts player_1.inspect
# puts player_1

player_2 = Player.new("lucy", 90)
player_3 = Player.new("jase")
player_4 = Player.new("alex", 125)

# player_4 = Player.new("alex", 125)
# puts player_4
# player_4.drain
# puts player_4
# player_4.boost
# puts player_4
# puts player_4.health
# player_4.name = "alexander"
# puts player_4

# puts say_hello(name: name, health_value: health_value)
# puts say_hello(name: "Jasee")



players = [player_1, player_2, player_3, player_4]

players.pop

player_5 = Player.new("cole", 75)
players.push(player_5)

game = Game.new("Winner Takes All")
# game.add_player(player_1)
# game.add_player(player_2)
# game.add_player(player_3)
# game.add_player(player_4)
players_filename = File.join(__dir__, "players.csv")
game.load_players(ARGV.shift || players_filename)

loop do

  print "\nHow many game rounds? ('quit' to exit) "
  answer = gets.chomp.downcase

  case answer
  when /^\d+$/    # types number
    game.play(answer.to_i)
  when "quit", "exit"
    game.print_stats
    break
  else
    puts "Please enter a number or 'quit'"
  end
end

game.save_high_scores

# game.play(2)
game.print_stats



# player_5 = Player.new("alvin", 100)
# player_6 = Player.new("simon", 60)
# player_7 = Player.new("theo", 125)

# chipmunks = Game.new("Chipmunks")
# chipmunks.add_player(player_5)
# chipmunks.add_player(player_6)
# chipmunks.add_player(player_7)
# chipmunks.play

# chipmunks.print_stats