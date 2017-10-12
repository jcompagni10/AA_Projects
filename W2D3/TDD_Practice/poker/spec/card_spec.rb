require "card"
require "rspec"


RSpec.describe Card do
  subject(:card) {Card.new(5, :heart)}
  describe "::initialize" do
    it "has a suit" do
      expect(card.suit).to eq(:heart)
    end
    it "has a number" do
      expect(card.number).to eq(5)
    end
  end
  describe "#to_s" do
    it "prints a string of the cards info" do
      expect(card.to_s).to include("heart")
      expect(card.to_s).to include("5")
    end
  end
end
