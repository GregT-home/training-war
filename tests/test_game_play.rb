Dir['../src/*.rb'].each { |file| require_relative "#{file}" }
require 'minitest/autorun'
#require 'minitest/pride'

class TestGamePlay < MiniTest::Unit::TestCase
  def test_game_play
    war=WarGame.new

    player1=WarPlayer.new
    player2=WarPlayer.new

    if war.make_war([player1,player2]) == player1
      print "Player1 won in #{war.iterations_until_won}\n"
    else
      print "Player2 won in #{war.iterations_until_won}\n"
    end
  end

  def test_multiple_game_play
    def play_one_game
      war=WarGame.new

      player1=WarPlayer.new
      player2=WarPlayer.new

      if war.make_war([player1,player2]) == player1
        print "Player1 won in #{war.iterations_until_won}\n"
      else
        print "Player2 won in #{war.iterations_until_won}\n"
      end
    end

    repeat=3
    repeat.times { play_one_game }

    # if we got this far with a winner in each case, we are declaring victory
    assert(true)
  end #test multiple game play
end # TestCardDeck

