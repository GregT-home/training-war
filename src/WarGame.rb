class WarGame
  @iterations_until_won
  @debug

  def  initialize(debug=0)
    @iterations_until_won = 1
  end
  
  def battle(player1, player2, escrow=[])
    card1=player1.take_top_card
    card2=player2.take_top_card

    if card1 == NIL
      if player1.warchest?
        player1.merge_won_into_cards
        card1=player1.take_top_card
      end

      # if player 1 is still out of cards after a warchest recharge, then he loses
      if (card1 == NIL)
        escrow.push(card2) if card2 != NIL
        player2.wins_card(escrow.pop)
        return player2
      end
    end

    if card2 == NIL
      if player2.warchest?
        player2.merge_won_into_cards
        card2=player2.take_top_card
      end

      # if player 2 is out of cards after a warchest recharge, then he loses
      if (card2 == NIL)
        escrow.push(card1) if card1 != NIL
        player1.wins_card(escrow.pop)
        return player1
      end
    end
    
    # put the cards into escrow pending the outcome of the battle
    escrow.push(card1, card2)
    
    # player 1 wins
    if (card1.value > card2.value)
      until escrow == []
        player1.wins_card(escrow.pop)
      end
      # player 2 wins
    else if (card2.value > card1.value)
           until escrow == []
             player2.wins_card(escrow.pop)
           end
         else
           battle(player1, player2, escrow)
         end
    end
  end

  def make_war(player1, player2, test_deck=[])
    game_deck=CardDeck.new
    game_deck.shuffle

    # allow deck setting for testing purposes
    if test_deck != []
      game_deck=test_deck
    end
    
    # deal the cards evenly
    while game_deck.number_of_cards > 0
      player1.receive_card(game_deck.take_top_card)
      player2.receive_card(game_deck.take_top_card)
    end
    
    while player1.number_of_cards > 0 && player2.number_of_cards > 0
      @iterations_until_won += 1
      battle(player1, player2)
    end

    if player1.number_of_cards > 0
      player1
    else
      player2
    end
  end

  def iterations_until_won
    @iterations_until_won
  end
end # WarGame


