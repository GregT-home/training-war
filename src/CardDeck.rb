class CardDeck
  @deck = []

  def initialize(test_deck=[])

    if test_deck != []
      @deck = test_deck
    else
      @deck = PlayingCard::SUITS.map { |suit| 
        PlayingCard::RANKS.map { |rank|
          PlayingCard.new(rank,suit)
        }
      }.flatten
    end
  end

  def  number_of_cards
    @deck.length
  end

  def deal(players)
    while number_of_cards > 0
      players.each { | player |  player.receive_card(take_top_card) }
    end
  end

  def shuffle
    @deck.shuffle!
  end

  def take_top_card
    @deck.pop
  end
  
end # CardDeck
