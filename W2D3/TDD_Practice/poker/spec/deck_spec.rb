require "deck"
require "rspec"


RSpec.describe Deck do

  subject(:deck) { Deck.new }

  describe "::initialize" do
    it "it generates a deck of 52 cards" do
      expect(deck.cards.length).to eq(52)
    end
  end
  describe '#shuffle' do
    it "shuffles the deck" do
      deck.shuffle
      expect(deck.cards).to_not eq(Deck.new.cards)
    end
  end

  describe '#deal' do
    it "deal a card" do
      expect(deck.deal).to be_a(Card)
      expect(deck.cards.length).to eq(51)
    end
  end

end
