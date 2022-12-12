require_relative '../lib/neighbor'
require_relative '../lib/slot'

describe Neighbor do

  describe "#initialize" do

    context "when neighbor relationship is setup" do

      before do 
        main_slot = Slot.new(0, 0)
        second_slot = Slot.new()
      end

      it "adds to slot a neighbor slot" do
      end
    end
  end
end