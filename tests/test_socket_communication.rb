# print "requiring: ", Dir['../src/*.rb']; puts

Dir['../src/*.rb'].each { |file| require_relative "#{file}" }
require "minitest/autorun"
#require "minitest/pride"
require "socket"

class Test_Socket_Ops < MiniTest::Unit::TestCase
  @@Port = WarGame_Server::OUR_PORT

  def setup
    @server=WarGame_Server.new
  end

  def teardown
    @server.close
  end

  def test_listening
    server = TCPSocket.new("localhost", @@Port)
    pass('Connection accepted')

  rescue Errno::ECONNREFUSED
    flunk("Refused Connection")
  end

  def test_server_can_receive
    # we are both client and server in this test
    to_server = TCPSocket.open("localhost", @@Port)
    to_client = @server.accept_client

    send_string = "sample string"

    # as client, put a string into the socket
    to_server.puts send_string
    # as server, retrieve a string from the socket
    return_string = to_client.gets send_string

    assert_equal(send_string, return_string)
  end

  def test_server_can_receive_from_two_clients
    return_string=[]
    # we are both client and server in this test
    # as client
    to_server = [
                 TCPSocket.open("localhost", @@Port),
                 TCPSocket.open("localhost", @@Port) ]

    # as server
    to_client = [
                 @server.accept_client,
                 @server.accept_client ]

    send_string = "sample string"

    # as client, put strings into their respective sockets
    to_server.each { | ios | ios.puts send_string }

    # as server, retrieve strings from their respective sockets
    to_client.each_with_index { | ios, i |
      return_string[i] = ios.gets.chomp
    }
    assert_equal(send_string, return_string[0])
    assert_equal(send_string, return_string[1])
  end    

  def test_server_can_have_a_battle
    war=WarGame.new

    players = [
            WarPlayer.new,
            WarPlayer.new ]

    


  end  


end # Test_Socket_Ops

