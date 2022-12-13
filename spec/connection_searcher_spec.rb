require_relative '../lib/connection_searcher'
require_relative '../lib/board'

describe ConnectionSearcher do

  before(:all) do
    @test_board = Board.new()
    @test_board.create_slots
    @test_board.setup_neighbors
    @test_board.add_searcher
    @searcher = @test_board.connection_searcher
  end

  describe "#search" do

    

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
end