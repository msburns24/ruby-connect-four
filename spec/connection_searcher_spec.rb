require_relative '../lib/connection_searcher'
require_relative '../lib/board'

describe ConnectionSearcher do

  before(:each) do
    @test_board = Board.new()
    @test_board.create_slots
    @test_board.setup_neighbors
    @test_board.add_searcher
    @searcher = @test_board.connection_searcher
  end

  describe "search" do

    

    context "When no solution exists" do

      it "returns nil" do
        base_slot = @searcher.slots[0][0]
        search_results = @searcher.search(base_slot)
        expect(search_results).to be_nil
      end
    end

    context "When solution exists in zeroth col" do

      it "returns black" do
        4.times { @test_board.add_piece("black",0) }
        base_slot = @searcher.slots[0][0]
        search_results = @searcher.search(base_slot)
        expect(search_results).to eq("black")
      end
    end
  end

  describe "find_conn_length" do
    before do
    end

    context "when length is 3 in vertical direction" do

      before do 
        3.times { @test_board.add_piece("black",0) }
        @root = @test_board.slots[0][0]
        @first_neighbor = @test_board.slots[0][1]
        @direction = "vertical"
      end

      it "returns value of 3" do
        result = @searcher.find_conn_length(@root, @first_neighbor, @direction)
        expect(result).to eq(3)
      end
    end
  end
end