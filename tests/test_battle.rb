Dir['../src/*.rb'].each { |file| require_relative "#{file}" }
require 'minitest/autorun'
#require 'minitest/pride'

class TestWar < MiniTest::Unit::TestCase
  def setup
    @war=WarGame.new
  end  

  def test_execution_of_code_block
    player1=WarPlayer.new([PlayingCard.new('A','C')], "P1")
    player2=WarPlayer.new([PlayingCard.new('2','S')], "P1")
    @war.battle([player1,player2]) { | card1, card2, winner, i |
      print "\nfrom code block:\n"
      print "card 1 = #{card1.name}, card 2 = #{card2.name} in round #{i}\n"
      print "result: #{winner == player1 ? 'player1 wins' : 'player2 wins'}\n"
      print "P1 has #{player1.number_of_cards} cards\n"
      print "P2 has #{player2.number_of_cards} cards\n"
    }
    # winning player should have both cards in his war_chest
    assert_equal(2, player1.number_of_cards)
    assert_equal(0, player2.number_of_cards)
    assert_equal(true, player1.war_chest?)
    assert_equal(false, player2.war_chest?)
  end
  def test_player1_wins
    player1=WarPlayer.new([PlayingCard.new('A','C')])
    player2=WarPlayer.new([PlayingCard.new('2','S')])
    @war.battle([player1,player2])
    # winning player should have both cards in his war_chest
    assert_equal(2, player1.number_of_cards)
    assert_equal(0, player2.number_of_cards)
    assert_equal(true, player1.war_chest?)
    assert_equal(false, player2.war_chest?)
  end
  
  def test_player2_wins
    player1=WarPlayer.new([PlayingCard.new('7','D')])
    player2=WarPlayer.new([PlayingCard.new('K','D')])
    @war.battle([player1,player2])
    # winning player should have both cards in his war_chest
    assert_equal(0, player1.number_of_cards)
    assert_equal(2, player2.number_of_cards)
    assert_equal(true, player2.war_chest?)
    assert_equal(false, player1.war_chest?)
  end

  def test_war_chest_merge
    player1=WarPlayer.new([PlayingCard.new('A','C')])
    player2=WarPlayer.new([PlayingCard.new('2','S')])
    @war.battle([player1,player2])
    # winning player should have both cards in his war_chest
    assert_equal(true, player1.war_chest?)
    player1.merge_war_chest_into_cards
    assert_equal(false, player1.war_chest?)
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
    @war.battle([player1,player2])
    # winning player should have all  cards
    assert_equal(0, player1.number_of_cards)
    assert_equal(6, player2.number_of_cards)
  end
end
