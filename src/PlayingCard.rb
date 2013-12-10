class PlayingCard

  def initialize(value)
    @value = value
  end

  def value
    tmp=%w(2 3 4 5 6 7 8 9 J K Q A).index(@value)
#    printf "index of value is %d\n", tmp
    tmp
  end
end # End WarPlayer

