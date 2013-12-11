require "socket"
require_relative "../src/server/Server_WarGame"

def start_server

puts "start"
server = WarGame_Server.new
puts "done"

end
start_server
