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

  # describe "#create_connection" do

  #   before do 
  #     test_board.create_slots
  #     test_board.setup_neighbors
  #   end

  #   context "when new connection is created" do

  #     it "adds slot to connections list" do
  #       test_board.create_connection
  #       slot1 = test_board[0][0]
  #       slot2 = test_board[0][1]
  #       test_board.create
  #     end
  #   end
  # end

end