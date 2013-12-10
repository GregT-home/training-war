class WarGame

  def initialize
    @@escrow=[]
  end
  
  def play_round(player1, player2)
    card1=player1.take_top_card
    card2=player2.take_top_card

    if (card1 == NIL || card2 == NIL)
      raise("Someone is out of cards")
    end
    
    @@escrow.push(card1, card2)

    # player 1 wins
    if (card1.value > card2.value)
      until @@escrow == []
        player1.receive_card(@@escrow.pop)
      end
#      printf "Player 1 wins, # cards = %d\n", player1.cards.length
    else
        # player 1 wins
      if (card2.value > card1.value)
        until @@escrow == []
          player2.receive_card(@@escrow.pop)
        end
#        printf "Player 2 wins, # cards = %d\n", player2.cards.length
      else
#        printf "Players tie\n"
        play_round(player1, player2)
      end
    end
  end
end #WarGame
