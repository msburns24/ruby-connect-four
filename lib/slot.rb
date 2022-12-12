class Slot
  attr_reader :col, :row, :neighbors, :neig_directions
  def initialize(col, row)
    @col = col
    @row = row
    @neighbors = []
    @neig_directions = {}
    @connections = []
  end

  def new_neighbor(slot, direction, first_made = false)
    @neighbors << slot
    @neig_directions[slot] = direction
    slot.new_neighbor(self, direction, true) unless first_made
  end
end