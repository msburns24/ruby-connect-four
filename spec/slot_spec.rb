require_relative '../lib/slot'

describe Slot do

  subject(:test_slot) { described_class.new(0, 0) }

  describe "#new_neighbor" do
  end

  describe "#neighbor_with?" do
    context "When neighbor is added" do
      before do
        other_slot = Slot.new(0,1)
        test_slot.neighbors 
      end
    end
  end
end