require_relative 'slot'
require_relative 'neighbor'

class Board
  attr_reader :slots
  
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

  def create_neighbors
    (0..6).each do |col|
      (0..5).each do |row|
        slot = @slots[col][row]
        slot.neighbors << Neighbor.new(slot, @slots[col][row+1]) unless row==5
      end
    end
  end
end