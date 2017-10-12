require "rspec"
require "tdd_practice"

describe Array do

  describe "#my_uniq" do

    context "When given a non-empty array" do
      it "returns an array with no duplicates in same order" do
        expect([1,2,3,4,4].my_uniq).to eq([1,2,3,4])
      end
    end
    it "returns an empty array if given an empty array" do
      expect([].my_uniq).to be_empty
    end

  end

  describe '#two_sum' do
    it "returns and empty array when there are no two sums to 0" do
      expect([].two_sum).to eq([])
    end

    it "returns only the indices of all unique values summing to zero" do
      expect([-1, 0, 2, -2, 1].two_sum).to include([0,4], [2,3])
    end

    it "index pairs are returned in ascending order only once" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0,4],[2,3]])
    end
  end

  describe "#my_transpose" do
    subject(:matrix) do [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8] ]
    end

    let(:transposed) do [
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8] ]
    end

    it "returns an empty matrix if given an empty matirx" do
      expect([[]].my_transpose).to eq([[]])
    end

    it "returns a transposed matrix if given a square matrix" do
      expect(matrix.my_transpose).to eq(transposed)
    end
  end

  describe '#stock_picker' do
    it "returns nil if the array contains fewer than two days" do
      expect([].stock_picker).to be_nil
      expect([1].stock_picker).to be_nil
    end
    it "returns the most profitable pair of stocks from a populated array" do
      expect([6,4,8,3448,1].stock_picker).to eq([1, 3])
    end

  end
end
