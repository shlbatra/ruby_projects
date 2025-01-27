require "minitest/autorun"
require_relative "../../lib/studio_game/player"
require_relative "../../lib/studio_game/game"

class GameTest  < Minitest::Test
  def setup
    @game = Game.new("game1")
    @player1 = Player.new("joe", 60)
    @player2 = Player.new("mark", 75)
    $stdout = StringIO.new
  end

  def test_has_no_players_initially
    assert_empty @game.players
  end

  def test_add_players
    @game.add_player(@player1)
    @game.add_player(@player2)
    refute_empty @game.players
    assert_equal [@player1, @player2], @game.players
  end

  def test_boosts_the_player_if_a_high_number_is_rolled
    @game.add_player(@player1)
    @game.stub(:roll_die, 6) do # overwrite to return fixed value
      @game.play()
      assert_equal 75, @player1.health 
    end
  end

  def test_drains_the_player_if_a_low_number_is_rolled
    @game.add_player(@player1)
    @game.stub(:roll_die, 1) do # overwrite to return fixed value
      @game.play()
      assert_equal 50, @player1.health 
    end
  end

  def test_skips_the_player_if_a_medium_number_is_rolled
    @game.add_player(@player1)
    @game.stub(:roll_die, 3) do # overwrite to return fixed value
      @game.play()
      assert_equal 60, @player1.health 
    end
  end
end