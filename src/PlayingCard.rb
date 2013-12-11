class PlayingCard
  # define Constants so we don't have to use the same literal string everywhere
  RANKS =   %w(2 3 4 5 6 7 8 9 10 J Q K A)
  SUITS = %w(C D H S)

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
end

  def value
    RANKS.index(@rank)
    # suit is currently ignored
  end
end # PlayingCard
