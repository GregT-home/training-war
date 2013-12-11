Dir['../src/*.rb'].each { |file| require_relative "#{file}" }
require 'minitest/autorun'
#require 'minitest/pride'

class TestCardDeck < MiniTest::Unit::TestCase
  def test_deck_shuffle
    test_deck = CardDeck.new
    shuffled_deck = CardDeck.new

    assert_equal(52, test_deck.number_of_cards)
    assert_equal(52, shuffled_deck.number_of_cards)
    assert(test_deck.deal.is_a?(PlayingCard))
    assert(shuffled_deck.deal.is_a?(PlayingCard))
    #    assert_equal(test_deck, shuffled_deck)
    #    shuffled_deck.shuffle
    #    assert_not_equal(test_deck, shuffled_deck)
  end

  def test_deal
    game_deck=CardDeck.new
    player1=WarPlayer.new
    player2=WarPlayer.new

    game_deck.shuffle
    
    # deal the cards evenly
    while game_deck.number_of_cards > 0
      player1.receive_card(game_deck.take_top_card)
      player2.receive_card(game_deck.take_top_card)
    end

    assert_equal(0, game_deck.number_of_cards)
    assert_equal(26, player1.number_of_cards)
    assert_equal(player1.number_of_cards,player2.number_of_cards)
  end

  def test_game_play
    war=WarGame.new

    player1=WarPlayer.new
    player2=WarPlayer.new

    if war.play_game(player1,player2) == player1
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

      if war.play_game(player1,player2) == player1
        print "Player1 won in #{war.iterations_until_won}\n"
      else
        print "Player2 won in #{war.iterations_until_won}\n"
      end
    end
    50.times { play_one_game }
  end #test multiple game play
end # TestCardDeck

