Dir['../src/*.rb'].each { |file| require_relative "#{file}" }
require "minitest/autorun"
#require "minitest/pride"
require "socket"

class Test_Interactive_Play < MiniTest::Unit::TestCase
  def setup
    @server=WarGame_Server.new
  end

  def teardown
    @server.close
  end

  def test_player_type_can_be_seen
    player = WarPlayer.new([], "Player 1", false)

    assert_equal(player.interactive, false, "created player is interactive!")
  end

  def test_player_can_be_asked_something
    skip ("works, but want to avoid interactivity for a while")
    player = WarPlayer.new([], "Player 1", true)
    
    assert_equal(player.interactive, true, "created player is non-interactive!")
    
    response = player.ask_to_play("interactive compilation? (press enter)")
    puts response

    refute_equal(nil, response, "Response was nil!")
  end

  def test_game_play_with_interactive_player
    war=WarGame.new

    player1=WarPlayer.new([], "Player 1", true)
    player2=WarPlayer.new([], "Player 2", false)

    result = war.make_war([player1,player2],
                          [
                           PlayingCard.new('A','H'),
                           PlayingCard.new('2','H'),
                           PlayingCard.new('A','D'),
                           PlayingCard.new('2','S'),
                           PlayingCard.new('A','S'),
                           PlayingCard.new('2','C')
                          ] )

    if result == player1
      print "#{player1.name} wins in #{war.battle_number}\n"
    else
      print "#{player1.name} wins in #{war.battle_number}\n"
    end
  end

  def test_can_report_to_player
    war = WarGame.new
    war.toggle_debug

    player = WarPlayer.new([], "Player 1", false)

    test_msg = "Ready to Play!"
    player.report test_msg

    # server needs to accept the request
    #    to_client = @server.accept_client


    #  returned_msg = to_client.gets.chomp
    #    assert(returned_msg, test_msg, "returned msg != test msg)")
  end



  def test_player_can_report
    skip "test not ready"

    war=WarGame.new

    players = [ WarPlayer.new ]

  end  

end # Test_Socket_Ops

