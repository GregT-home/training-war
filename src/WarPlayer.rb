class WarPlayer
  attr_reader :interactive
  attr_reader :active_cards
  attr_reader :won_cards
  attr_reader :name
  @server_fd

  @debug=false
  def debug_toggle
    @debug = ! @debug
  end

  def initialize(active_cards=[], name = "Unnamed Player", interactive=false)
    @name = name
    @active_cards = active_cards
    @won_cards = []
    @interactive = interactive
#    @server_fd = TCPSocket.new("localhost", WarGame_Server::OUR_PORT)
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

