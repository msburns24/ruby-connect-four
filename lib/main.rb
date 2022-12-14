require_relative 'board'

# Create board instance, create slots / neighbors
my_board = Board.new()
my_board.create_slots
my_board.setup_neighbors

total_array = [
  [nil, nil, nil, nil, nil, nil, nil],
  ["red", nil, nil, nil, nil, nil, nil],
  ["yellow", nil, "red", nil, "red", nil, "red"],
  ["yellow", "yellow", "red", "yellow", "red", "yellow", "yellow"],
  ["yellow", "red", "red", "red", "yellow", "yellow", "yellow"],
  ["red", "red", "red", "yellow", "yellow", "yellow", "red"]
]

5.downto(0) do |row|
  (0..6).each do |col|
    color = total_array[row][col]
    next if color.nil?
    my_board.add_piece(color, col)
  end
end

require 'json'

pieces_array = []
my_board.slots.each do |column|
  pieces_array << []
  column.each do |slot|
    pieces_array[-1] << slot.to_json
  end
end

filename = "data/test_board_no_win.json"
File.write(filename, JSON.dump(pieces_array))