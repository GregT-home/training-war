Dir['../src/*.rb'].each { |file| require_relative "#{file}" }
require 'minitest/autorun'
#require 'minitest/pride'

class TestWar < MiniTest::Unit::TestCase
  def setup
    @war=WarGame.new
  end  

  def test_player1_wins
#   printf "Testing %s...", __method__
    player1=WarPlayer.new([PlayingCard.new('A')])
    player2=WarPlayer.new([PlayingCard.new('2')])
    @war.play_round(player1,player2)
    # winning player should have both cards
    assert_equal(2, player1.number_of_cards)
    assert_equal(0, player2.number_of_cards)
#    print "Success!\n"
  end

  def test_player2_wins
#    printf "Testing %s...", __method__
    player1=WarPlayer.new([PlayingCard.new('7')])
    player2=WarPlayer.new([PlayingCard.new('K')])
    @war.play_round(player1,player2)
    # winning player should have both cards
    assert_equal(0, player1.number_of_cards)
    assert_equal(2, player2.number_of_cards)
#    print "Success!\n"
  end

  def test_players_tie
#    printf "Testing %s...", __method__
    player1=WarPlayer.new([PlayingCard.new('K'),
                           PlayingCard.new('7'),
                           PlayingCard.new('9')])
    player2=WarPlayer.new([PlayingCard.new('A'),
                           PlayingCard.new('7'),
                           PlayingCard.new('9')])
    @war.play_round(player1,player2)
    # winning player should have both cards
    assert_equal(0, player1.number_of_cards)
    assert_equal(6, player2.number_of_cards)

#    print "Success!\n"
  end

  
end
