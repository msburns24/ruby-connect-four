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
  end

  def new_neighbor(slot, direction, first_made = false)
    @neighbors << slot
    @neig_directions[slot] = direction
    slot.new_neighbor(self, direction, true) unless first_made
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