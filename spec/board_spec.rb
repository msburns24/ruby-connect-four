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

  describe '#create_neighbors' do

    context 'when neighbor relationships are created' do

      it 'should relate slot (0,0) to slot (0,1) in the same col' do
        first_slot = test_board.slots[0][0]
        second_slot = test_board.slots[0][1]
        first_neighbors = first_slot.neighbors
        expect(first_neighbors).to include?(second_slot)
      end

    end

  end

end