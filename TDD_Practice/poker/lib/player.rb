class Player
  attr_reader :hand, :bank, :folded,

  def initialize(name, bank=100)
    @folded
  end

  def pay(num)

  end

  def get_hand(deck)
  end

  def receive(num)
  end

  def get_action
  end

  def raise_amt
  end

  def bet_amt
  end

  def prompt_discard
  end

  def take_cards(n)
  end

  def hate_the_game(amount)
  end




  private
  def fold
    @folded = true
  end



end
