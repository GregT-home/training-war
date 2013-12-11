Dir['../src/*.rb'].each { |file| require_relative "#{file}" }
require 'minitest/autorun'
#require 'minitest/pride'

class TestWar < MiniTest::Unit::TestCase
  def setup
    @war=WarGame.new
  end  

  def test_player1_wins
    player1=WarPlayer.new([PlayingCard.new('A','C')])
    player2=WarPlayer.new([PlayingCard.new('2','S')])
    @war.play_round(player1,player2)
    # winning player should have both cards in his warchest
    assert_equal(2, player1.number_of_cards)
    assert_equal(0, player2.number_of_cards)
    assert_equal(true, player1.warchest?)
    assert_equal(false, player2.warchest?)
  end
  
  def test_player2_wins
    player1=WarPlayer.new([PlayingCard.new('7','D')])
    player2=WarPlayer.new([PlayingCard.new('K','D')])
    @war.play_round(player1,player2)
    # winning player should have both cards in his warchest
    assert_equal(0, player1.number_of_cards)
    assert_equal(2, player2.number_of_cards)
    assert_equal(true, player2.warchest?)
    assert_equal(false, player1.warchest?)
  end

  def test_warchest_merge
    player1=WarPlayer.new([PlayingCard.new('A','C')])
    player2=WarPlayer.new([PlayingCard.new('2','S')])
    @war.play_round(player1,player2)
    # winning player should have both cards in his warchest
    assert_equal(true, player1.warchest?)
    player1.merge_won_into_cards
    assert_equal(false, player1.warchest?)
  end

  def test_players_tie
    player1=WarPlayer.new(
                          [PlayingCard.new('K','H'),
                           PlayingCard.new('7','S'),
                           PlayingCard.new('9','C')])
    player2=WarPlayer.new(
                          [PlayingCard.new('A','H'),
                           PlayingCard.new('7','D'),
                           PlayingCard.new('9','S')])
    @war.play_round(player1,player2)
    # winning player should have all  cards
    assert_equal(0, player1.number_of_cards)
    assert_equal(6, player2.number_of_cards)
  end
end
