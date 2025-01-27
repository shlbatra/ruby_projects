require "minitest/autorun"
require_relative "../../lib/studio_game/player"

class PlayerTest < Minitest::Test
  
  def test_has_a_capitalized_name
    player = Player.new("joe", 10)
    assert_equal "Joe", player.name
  end

  def test_has_an_initial_health
    player = Player.new("joe", 10)
    assert_equal 10, player.health
  end

  def test_computes_score_as_sum_of_health_and_length_of_name
    player = Player.new("joe", 10)
    assert_equal 13, player.score
  end

  def test_has_a_string_representation
    player = Player.new("joe", 10)
    assert_equal "I am Joe with a health of 10 and score of 13", player.to_s
  end

  def test_boost_increases_health_by_15
    player = Player.new("joe", 10)
    player.boost()
    assert_equal 25, player.health
  end

  def test_drained_decreases_health_by_10
    player = Player.new("joe", 10)
    player.drain()
    assert_equal 0, player.health
  end

end