class WarPlayer
  attr_reader :cards
  
  def initialize(cards=[])
    @cards = cards
  end

  def number_of_cards
    @cards.length
  end
  
  def take_top_card
    @cards.pop
  end

  def receive_card(newcard)
    @cards.unshift(newcard)
  end

  def shuffle
    @cards.shuffle!
  end
  
end # WarPlayer
  
