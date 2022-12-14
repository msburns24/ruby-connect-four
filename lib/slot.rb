require 'json'

class Slot
  attr_reader :col, :row, :neighbors, :neig_directions
  attr_accessor :color
  def initialize(col, row, color = nil)
    @col = col
    @row = row
    @color = color
    @neighbors = []
    @neig_directions = {}
    @connections = []
    @conn_directions = {}
    @conn_lengths = {}
  end

  def new_neighbor(slot, direction, first_made = false)
    @neighbors << slot
    @neig_directions[slot] = direction
    slot.new_neighbor(self, direction, true) unless first_made
  end

  def new_connection(slot, direction)
    @connections << slot
    @conn_directions[slot] = direction
    if slot.connection_exists?(direction)
      @conn_lengths[slot] = 2
      ## Need to find a way to recursively add connections to other slots
    end
  end

  def connection_exists?(direction)
    @conn_directions.keys.include?(direction)
  end

  def to_json
    {
      JSON.create_id => self.class.name,
      'col' => col,
      'row' => row,
      'color' => color
    }
  end

  def self.from_json(data_hash)
    new(data_hash['col'], data_hash['row'], data_hash['color'])
  end
end