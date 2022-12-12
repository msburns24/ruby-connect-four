require_relative '../lib/slot'

describe Slot do

  subject(:test_slot) { described_class.new(0, 0) }

  describe "#new_neighbor" do

    context "When new neighbor is created" do

      it "shows slot2 in slot1's neighbors" do
        slot1 = Slot.new(0,0)
        slot2 = Slot.new(0,1) # Above slot1
        slot1.new_neighbor(slot2, "vertical")
        expect(slot1.neighbors).to include(slot2)
      end

      it "shows slot1 in slot2's neighbors" do
        slot1 = Slot.new(0,0)
        slot2 = Slot.new(0,1) # Above slot1
        slot1.new_neighbor(slot2, "vertical")
        expect(slot2.neighbors).to include(slot1)
      end

      it "shows the correct direction to slot2" do
        slot1 = Slot.new(0,0)
        slot2 = Slot.new(0,1) # Above slot1
        slot1.new_neighbor(slot2, "vertical")
        direction = slot1.neig_directions[slot2]
        expect(direction).to eq("vertical")
      end
    end
  end
end