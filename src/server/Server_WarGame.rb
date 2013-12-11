class WarGame_Server
  # define our unregistered port to allow for coordination between modules
  OUR_PORT=54011

  def initialize
    port = OUR_PORT	# listen on our port
    server = TCPServer.open(port)	# listen on our port
    puts "Server listening in on #{port}"
    loop {
      client = server.accept
      send_string=Time.new.ctime
      client.puts(send_string)
      puts "Sending a client #{send_string}"
      client.puts "Closing the connection"
      client.close
    }
  end
end # Server_WarGame
