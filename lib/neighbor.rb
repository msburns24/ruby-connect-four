class Neighbor
  # Directions can be vertical, horizontal,  
  # upslope (from bottom-left to top-right), or 
  # downslope (from top-left to bottom-right)

  def initialize(slot, neighboring_slot, direction, first_made = false)
    @slot = slot
    @neighboring_slot = neighboring_slot
    @direction = direction

    setup_reverse(first_made) # Setup reverse relationship
  end

  def setup_reverse(first_made)
    unless first_made
      @neighboring_slot.new_neighbor(Neighbor.new(
        @neighboring_slot,
        @slot,
        @direction,
        true # Prevent infinite loop of back-and-forth relationships
      )
    end
  end
end