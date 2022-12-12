class Slot
  attr_reader :col, :row, :neighbors
  def initialize(col, row)
    @col = col
    @row = row
    @neighbors = []
  end

  def new_neighbor(slot, direction)
  end
end