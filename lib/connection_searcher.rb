class ConnectionSearcher

  attr_reader :slots

  def initialize(slots)
    @slots = slots
  end

  def search(slot, stack = [], visited = [])
    # Add slot's neighbors to stack
    visited << slot

    slot.neighbors.each do |neighbor_i|
      next if visited.include?(neighbor_i)
      stack << neighbor_i unless stack.include?(neighbor_i)

      if neighbor_i.color && (neighbor_i.color == slot.color)
        direction_i = slot.neig_directions[neighbor_i]
        max_length = find_conn_length(slot, neighbor_i, direction_i)
        return neighbor_i.color if max_length >= 4
      end
    end

    # While stack isn't empty:
    until stack.empty?
      next_slot = stack.pop
      search(next_slot, stack, visited)
    end
    return nil
  end

  def find_conn_length(root, first_neighbor, direction, length = 2)
    # Consider all neighbors of "first_neighbor"
    neighbors = first_neighbor.neighbors
    neighbors -= [root]
    direction_hash = first_neighbor.neig_directions
    neighbors.each do |neighbor_i|
      if direction_hash[neighbor_i] == direction && neighbor_i.color == first_neighbor.color
        length = find_conn_length(first_neighbor, neighbor_i, direction, length + 1)
      end
    end
    return length
  end
end