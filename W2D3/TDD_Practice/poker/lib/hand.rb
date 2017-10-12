class Hand

  # do we really need this beyond testing?
  attr_reader :cards

  def initialize(deck)
    @deck = deck
    @cards = []
    5.times {@deck.deal}
  end

  def add_card

  end

  def remove_card(card_idx)

  end

  def value

  end

  def render

  end

end
