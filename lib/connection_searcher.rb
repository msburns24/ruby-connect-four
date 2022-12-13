class ConnectionSearcher

  attr_reader :slots

  def initialize(slots)
    @slots = slots
  end

  def search(slot, color = nil, direction = nil, stack = [], visited = [], depth = 0)
    # Add neighbors
    slot.neighbors.each { |slot_i| stack << slot_i }
    visited << slot 
    
    # If slot is colored, check neghbors for same color
    if slot.color
      next_slot = stack.pop
      next_direction = slot.neig_directions[next_slot]
      search(
        next_slot,
        slot.color,
        next_direction,
        stack,
        visited,
        (depth + 1)
      )
    end
  end
end