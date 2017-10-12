require 'rspec'
require 'board'

RSpec.describe Board do

  subject(:board) { Board.new }
  let(:winning_board) { Board.new([[],[3,2,1],[]]) }

  describe '#initialize' do
    it "creates a 3x3 array for the towers" do
      expect(board.pegs).to have(3).items # maybe replace with arrays?
    end

    it "initializes when passed an array" do
      expect(winning_board.pegs).to eq([[],[3,2,1],[]])
    end

    it "it has a array of 3 disks of decreasing size in the first tower array" do
      expect(board.pegs[0]).to eq([3,2,1])
    end

    it "it does not have disks outside of the first tower array" do
      expect(board[1]).to be_empty
      expect(board[2]).to be_empty
    end
  end

  describe '#valid_move?' do
    it "only allows moves from valid towers (indices 0 to 2)" do
      expect(board.valid_move?([0,3])).to be_false
      expect(board.valid_move?([3,0])).to be_false
    end

    it "doesn't allow moves from empty towers" do
      expect(board.valid_move?([1,0])).to be_false
    end

    it "doesn't allow larger discs to be placed on smaller discs" do
      board.valid_move?([0,1])
      expect(board.valid_move?([0,1])).to be_false
    end
  end

  describe '#move' do
    it "moves a disc from one tower to another" do
      board.make_move([0,1])
      expect(board.pegs).to eq([[3, 2], [1], []])
    end

    it "raises an error on an invalid move" do
      board.make_move()
    end
  end

  describe '#won?' do
    it "doesn't evaluate to true if the game hasn't been won" do
      expect(board.won?).to be_false
    end

    it "evaluates to true if the game has been won" do
      expect(winning_board.won?).to be_true
    end
  end

end
