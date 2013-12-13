Dir['../src/*.rb'].each { |file| require_relative "#{file}" }
require 'minitest/autorun'
#require 'minitest/pride'

class TestCardDeck < MiniTest::Unit::TestCase
  def test_deck_shuffle
    test_deck = CardDeck.new
    shuffled_deck = CardDeck.new
    player=WarPlayer.new

    assert_equal(52, test_deck.number_of_cards)
    assert_equal(52, shuffled_deck.number_of_cards)
    test_deck.deal([player])
    card = player.take_top_card
    assert(card.is_a?(PlayingCard), "card is not a playing card")
    shuffled_deck.deal([player])
    card = player.take_top_card
    assert(card.is_a?(PlayingCard), "card is not a playing card")

  end

  def test_deal
    game_deck=CardDeck.new
    player1=WarPlayer.new
    player2=WarPlayer.new

    game_deck.shuffle
    
    # deal the cards
    game_deck.deal([player1, player2])

    assert_equal(0, game_deck.number_of_cards)
    assert_equal(26, player1.number_of_cards)
    assert_equal(player1.number_of_cards,player2.number_of_cards)
  end

end # TestCardDeck

