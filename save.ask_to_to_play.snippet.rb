  def ask_to_play(prompt)
    return "" unless @interactive

    puts(prompt)
    while true do
      case response=gets.chomp.downcase
        when "","q","Q"
        return response
      else
        puts("Please respond with 'Q', 'q', or ''.  ")
        ask_to_play(prompt)
      end
    end
  end
