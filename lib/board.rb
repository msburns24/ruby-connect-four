require_relative 'slot'

class Board
  attr_reader :slots, :neighbor_hash
  
  def initialize
    @slots = []
  end

  def create_slots
    # For each column (7)
    (0..6).each do |col|
      @slots << []
      # For each row in that column (6)
      (0..5).each do |row|
        # Create a new slot and add it into the column
        @slots[col] << Slot.new(col, row)
      end
    end
  end

  def setup_neighbors
    (0..6).each { |col| (0..5).each { |row| 
      @slots[col][row].new_neighbor(@slots[col][row+1], "vertical") unless row == 5
      @slots[col][row].new_neighbor(@slots[col+1][row], "horizontal") unless col == 6
      @slots[col][row].new_neighbor(@slots[col+1][row+1], "upslope") unless (col == 6 || row == 5)
      @slots[col][row].new_neighbor(@slots[col+1][row-1], "downslope") unless (col == 6 || row == 0)
    } }
  end
end