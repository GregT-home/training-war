#!/bin/bash

list="test_card_deck.rb
test_battle.rb
test_game_play.rb
test_socket_communication.rb
test_interactive_game_play.rb
"

for i in $list
do
    echo "ruby $i"
    ruby $i || {
	echo "?Error: stopping build"; exit
    }
    echo "---------------------------"
done
