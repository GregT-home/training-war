class WarGame
  attr_accessor :end_round, :end_game

  @battle_number
  @debug = false

  def  initialize
    @battle_number = 1
  end

  def toggle_debug
    @debug = ! @debug
  end

  def battle(players, escrow=[])
    player1=players[0]
    player2=players[1]

    card1=player1.get_next_card
    card2=player2.get_next_card

    # this yield has to move, but leave it here for now
    yield(card1, card2, "blah blah blah", @battle_number) if block_given?

    # put the cards into escrow pending the outcome of the battle
    escrow.push(card1, card2)

    if (card1.value > card2.value)
      until escrow == [] 
        player1.wins_card(escrow.pop)
      end
      #report the cards, player and winner of the battle
      yield(card1, card2, player1, @battle_number) if block_given?
    else if (card2.value > card1.value)
           until escrow == []
             player2.wins_card(escrow.pop)
           end
           yield(card1, card2, player2, @battle_number) if block_given?
         else
           yield(card1, card2, nil, @battle_number) if block_given?
           battle([player1, player2], escrow)
         end
    end
  end

  def make_war(players, test_deck=[])
    player1 = players[0]
    player2 = players[1]


    if test_deck != []
      # allow deck setting for testing purposes
      game_deck=CardDeck.new(test_deck)
    else
      game_deck=CardDeck.new
      game_deck.shuffle
    end
    
    # deal the cards evenly
    game_deck.deal([player1,player2])

    #    player1.report "Your pile contains #{player1.number_of_cards\n"
    
    # have at it
    while player1.number_of_cards > 0 && player2.number_of_cards > 0
      @battle_number += 1
      battle([player1, player2])
    end

    if player1.number_of_cards > 0
      player1
    else
      player2
    end
  end

  def battle_number
    @battle_number
  end

  def report_all(players,msg)
    players.each { | player | player.report msg }
  end

end # WarGame


