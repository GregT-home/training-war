class WarPlayer
  attr_reader :active_cards
  attr_reader :won_cards

  def initialize(active_cards=[])
    @active_cards = active_cards
    @won_cards = []
  end

  def number_of_cards
    @active_cards.length+@won_cards.length
  end

  def take_top_card
    @active_cards.pop
  end

  def receive_card(newcard)
    @active_cards.unshift(newcard)
  end

  def wins_card(newcard)
    @won_cards.unshift(newcard)
  end

  def warchest?
    won_cards != []
  end
  
  def merge_won_into_cards
    @active_cards += @won_cards
    @won_cards -= @won_cards
    shuffle
  end
  
  def shuffle
    @active_cards.shuffle!
  end
  
end # WarPlayer
  
