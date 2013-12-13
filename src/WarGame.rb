class WarGame

  @iterations_until_won
  @debug = false

  def  initialize
    @iterations_until_won = 1
  end

  def toggle_debug
    @debug = ! @debug
  end

  def battle(players, escrow=[])
    player1=players[0]
    player2=players[1]

    if player1.interactive
      player1.ask_to_play("Play? ")
    end

    card1=player1.take_top_card

    if card1 == NIL
      if player1.warchest?
        player1.merge_won_into_cards
        card1=player1.take_top_card
      end

      # if player 1 is still out of cards after a warchest recharge, then he loses
      if (card1 == NIL)
        player2.wins_card(escrow.pop)
        return player2
      end
    end

    if player2.interactive
      player2.ask_to_play("Play? ")
    end

    card2=player2.take_top_card
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
      report_all(players, "#{card1.name} beats #{card2.name}\n")
      player1.report "You win!\n"
      player2.report "You lost\n"
      # player 2 wins
    else if (card2.value > card1.value)
           until escrow == []
             player2.wins_card(escrow.pop)
           end
           report_all(players, "#{card2.name} beats #{card1.name}\n")
           player1.report "You lost\n"
           player2.report "You win!\n"
         else
           report_all(players, "#{card1.name} ties #{card2.name}\n")
           player1.report "Tie!  Play?\n"
           player2.report "Tie!  Play?\n"
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
      @iterations_until_won += 1
      battle([player1, player2])
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

  def report_all(players,msg)
    players.each { | player | player.report msg }
  end

end # WarGame


