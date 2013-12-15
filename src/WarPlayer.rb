class WarPlayer
  attr_reader :interactive,  :active_cards, :war_chest,  :name
  @server_fd

  @debug=false
  def debug_toggle
    @debug = ! @debug
  end

  def initialize(active_cards=[], name = "Unnamed Player", interactive=false)
    @name = name
    @active_cards = active_cards
    @war_chest = []
    @interactive = interactive
#    @server_fd = TCPSocket.new("localhost", WarGame_Server::OUR_PORT)
  end

  # return the next card to play.  If this requires recycling the war_chest, then do it.
  # return nil if no cards left
  def get_next_card
card = @active_cards.pop
    if card.nil? && war_chest?
      merge_war_chest_into_cards
      card = @active_cards.pop
    end
    card
  end

  def number_of_cards
    @active_cards.length+@war_chest.length
  end

  # def take_top_card
  #   @active_cards.pop
  # end

  def receive_card(newcard)
    @active_cards.unshift(newcard)
  end

  def wins_card(newcard)
    @war_chest.unshift(newcard)
  end

  def war_chest?
    war_chest != []
  end
  
  def merge_war_chest_into_cards
    @active_cards += @war_chest
    @war_chest -= @war_chest
    shuffle
  end
  
  def shuffle
    @active_cards.shuffle!
  end

  def ask_to_play(prompt)
    return "" unless @interactive

    puts(prompt)
    gets
  end

  def report(msg)
    if @interactive
      print "             (#{ '%10s' % name}): #{msg}\n"
    end
  end  
end # WarPlayer

