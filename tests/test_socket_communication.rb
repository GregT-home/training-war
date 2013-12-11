Dir['../src/*.rb'].each { |file| require_relative "#{file}" }
require_relative "../src/server/Server_WarGame"
require "minitest/autorun"
#require "minitest/pride"
require "socket"


class Test_Socket_Ops < MiniTest::Unit::TestCase
  def test_listening
    port = WarGame_Server::OUR_PORT

    TCPSocket.new("localhost", port)
    pass('Connection accepted')
  rescue Errno::ECONNREFUSED
    flunk("Refused Connection")
  end

  def test_read_1_line
    #    port = Server_WarGame::OUR_PORT
    port=54011

    server = TCPSocket.new("localhost", port)
    line = server.gets
    puts line
    

  end

end # Test_Socket_Ops

