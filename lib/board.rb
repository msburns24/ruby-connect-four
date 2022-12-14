require_relative 'slot'
require_relative 'connection_searcher'

class Board
  # attr_reader :slots
  attr_accessor :slots
  attr_accessor :connection_searcher
  
  def initialize()
    create_slots
    setup_neighbors
    add_searcher
  end

  def create_slots
    @slots = []
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

  def add_searcher
    @connection_searcher = ConnectionSearcher.new(@slots)
  end
  
  def add_piece(color, column)
    @slots[column].each do |slot_i|
      next unless slot_i.color.nil?
      slot_i.color = color
      return 1
    end
    return nil
  end

  def slots_from_json(filename)
    slots_array = []

    json_object = File.read(filename)
    slot_data_array = JSON.parse(json_object)
    slot_data_array.each do |col|
      slots_array << []
      col.each do |slot_data|
        slots_array[-1] << Slot.from_json(slot_data)
      end
    end

    @slots = slots_array
    setup_neighbors
  end

  def winner?
    @connection_searcher.search
  end

  def tie?
    @slots.each { |col| col.each { |slot| return false unless slot.color } }
  end
end