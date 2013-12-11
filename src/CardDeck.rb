class CardDeck
  @deck = []

  def initialize()
    @deck = PlayingCard::SUITS.map { |suit| 
      PlayingCard::RANKS.map { |rank|
        PlayingCard.new(rank,suit)
      }
    }.flatten
  end

  def  number_of_cards
    @deck.length
  end

  def deal
       @deck.pop
  end

  def shuffle
    @deck.shuffle!
  end

  def take_top_card
    @deck.pop
  end
  
end # CardDeck
