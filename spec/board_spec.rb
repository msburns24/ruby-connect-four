require_relative '../lib/board'

describe Board do

  subject(:test_board) { described_class.new }

  describe '#create_slots' do

    context 'when slots are created' do

      before do
        test_board.create_slots
      end

      it 'should create 7 columns' do
        expect(test_board.slots.length).to eq(7)
      end

      it 'should create 6 rows in each column' do
        col_lengths = []
        test_board.slots.each { |col| col_lengths << col.length }
        expect(col_lengths).to all(be == 6)
      end

    end
    
  end

  describe '#setup_neighbors' do

    before do 
      test_board.create_slots
      test_board.setup_neighbors
    end

    context 'when vertical relationships are created' do

      it "creates a relationship between (0,0) and (0,1)" do 
        slot1 = test_board.slots[0][0]
        slot2 = test_board.slots[0][1]
        expect(slot1.neighbors).to include(slot2)
      end

      it "creates a relationship as vertical" do 
        slot1 = test_board.slots[0][0]
        slot2 = test_board.slots[0][1]
        direction = slot1.neig_directions[slot2]
        expect(direction).to eq("vertical")
      end
    end

    context 'when horizontal relationships are created' do

      it "creates a relationship between (0,0) and (1,0)" do 
        slot1 = test_board.slots[0][0]
        slot2 = test_board.slots[1][0]
        expect(slot1.neighbors).to include(slot2)
      end

      it "creates a relationship as horizontal" do 
        slot1 = test_board.slots[0][0]
        slot2 = test_board.slots[1][0]
        direction = slot1.neig_directions[slot2]
        expect(direction).to eq("horizontal")
      end
    end

    context 'when upslope relationships are created' do

      it "creates a relationship between (0,0) and (1,1)" do 
        slot1 = test_board.slots[0][0]
        slot2 = test_board.slots[1][1]
        expect(slot1.neighbors).to include(slot2)
      end

      it "creates a relationship as upslope" do 
        slot1 = test_board.slots[0][0]
        slot2 = test_board.slots[1][1]
        direction = slot1.neig_directions[slot2]
        expect(direction).to eq("upslope")
      end
    end

    context 'when downslope relationships are created' do

      it "creates a relationship between (0,1) and (0,1)" do 
        slot1 = test_board.slots[0][1]
        slot2 = test_board.slots[1][0]
        expect(slot1.neighbors).to include(slot2)
      end

      it "creates a relationship as downslope" do 
        slot1 = test_board.slots[0][1]
        slot2 = test_board.slots[1][0]
        direction = slot1.neig_directions[slot2]
        expect(direction).to eq("downslope")
      end
    end
  end

  describe "#add_piece" do

    before do
      test_board.create_slots
      test_board.setup_neighbors
    end

    context "When black piece is added to col 0" do
      before do
        test_board.add_piece("black", 0)
      end

      it "changes color of slot (0,0) to black" do
        first_slot = test_board.slots[0][0]
        expect(first_slot.color).to eq("black")
      end

      it "doesn't change other colors in column" do
        other_colors = []
        test_board.slots[0][1..].each {|slot| other_colors << slot.color }
        expect(other_colors).to all(be_nil)
      end
      
    end

    context "when two black pieces are added to col 0" do
      before do
        2.times { test_board.add_piece("black", 0) }
      end

      it "makes color of slot (0,1) black" do
        slot2 = test_board.slots[0][1]
        expect(slot2.color).to eq("black")
      end

      it "doesn't change colors of slots [0][2..5]" do
        empty_slots = test_board.slots[0][2..]
        empty_slot_colors = []
        empty_slots.each { |slot| empty_slot_colors << slot.color }
        expect(empty_slot_colors).to all(be_nil)
      end

    end

    context "when black piece then red piece added to col 1" do
      before do
        test_board.add_piece("black", 1)
        test_board.add_piece("red", 1)
      end

      it "turns slot (1,0) to black" do
        slot1 = test_board.slots[1][0]
        expect(slot1.color).to eq("black")
      end

      it "turns slot (1,1) to red" do
        slot2 = test_board.slots[1][1]
        expect(slot2.color).to eq("red")
      end

    end

  end

end