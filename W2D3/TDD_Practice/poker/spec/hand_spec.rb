require "hand"
require "rspec"

RSpec.describe Hand do


  let(:card1) { double("card1", :suit => :heart, :number => 2) }
  let(:card2) { double("card2", :suit => :heart, :number => 3) }
  let(:card3) { double("card3", :suit => :heart, :number => 4) }
  let(:card4) { double("card4", :suit => :heart, :number => 5) }
  let(:card5) { double("card5", :suit => :heart, :number => 6) }
  let(:card6) { double("card6", :suit => :heart, :number => 7) }

  let(:cards) { [card1, card2, card3, card4, card5] }

  let(:deck) { double("deck", deal: cards.pop) }

  subject(:hand) { Hand.new(deck) }

  describe "::initialze" do
    it "initializes with 5 cards" do
      expect(hand.cards.length).to eq(5)
    end

    it "get 5 cards from the deck" do
      expect(deck).to receive("deal").exactly(5).times
      Hand.new(deck)
    end
  end

  describe '#add_card' do
    it "draws a card from the deck" do
      expect(deck).to receive("deal").exactly(6).times
      hand.add_card
    end
    it "adds the card into the cards array" do
      hand.add_card
      expect(hand.cards.length).to eq(6)
    end
  end

  describe '#remove_card' do
    it "removes the specific card the user specifies" do
      hand.remove_card(1)
      expect(hand.cards.length).to eq(4)
      expect(hand.cards).to_not include(card2)
    end
  end

  describe "#value" do
    it "returns a number" do
      expect(hand.value).to be_a(Integer)
    end
  end

end
