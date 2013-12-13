class TestWarSocketServer  MiniTest::Unit::TestCase
  def setup
    @server=WarSocketServer.new
  end

  def teardown
    @server.stop
  end



  def test_game_start
    client1= MockWarSocketClient.new(@server.port)
    @server.accept_new_client("Player 1")
    assert_equal(0, @server.games.count)
    client2 = MockWarSocketClient.new(@server.port)
    @server.accept_new-client("Player 2")
    assert_equal(, @server.games.count)
  end

  def test_play_round
  end  
end # TestWarSocketServer


test_server_Play_Round





accept_new cli 1
accept ew cli 2
games.first  ? what is?
server.play_round(ame)
client1.capture_output
client2.capture_output
puts client1.ouput
refute(client1.output.epty?. "client1 has no output")
refute(client2.output.epty?. "client2 has no output")
