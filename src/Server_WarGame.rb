class WarGame_Server
  # define our unregistered port to allow for coordination between modules
  OUR_PORT=54011
  @debug = false

  def initialize()
    @@server = TCPServer.open(OUR_PORT)	# listen on our port
    puts "[server listening in on #{OUR_PORT}]" if @debug
    return @@server
  end

  def toggle_debug
    @debug = ! @debug
  end

  # do we need this call?
  def accept_client
      @@server.accept
  end

  def close
    @@server.close
  end

end # Server_WarGame
