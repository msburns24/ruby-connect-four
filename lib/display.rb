require 'colorize'
require 'colorized_string'

class Display

  attr_accessor :errors

  def initialize(board)
    @board = board
    @current_player = nil
    @errors = []
  end

  def print_welcome
    system 'cls'
    msg = JSON.parse(File.read("data/opening_message.json"))
    msg.each { |line| puts line }

    puts "\n\nPress any key to continue..."
    gets
  end

  def print_board
    system 'cls'
    color_array = get_board_colors
    print_header
    color_array.each { |row| print_row(row) }
    print_base
  end

  def get_board_colors
    color_array = []
    6.times { color_array << [] }
    (0..6).each do |col_num|
      (0..5).each do |row_num|
        color_array[row_num] << @board.slots[col_num][5-row_num].color
      end
    end
    return color_array
  end

  def print_header
    puts ""
    (0..5).each { |i| print "   #{i}".colorize(:light_black) }
    puts "   6".colorize(:light_black)
  end

  def print_row(slot_row)
    slot_row.each do |color|
      print " |".colorize(:light_black)
      if color.nil? 
        print "  "
      else
        print " O".colorize(color.to_sym)
      end
    end
    print " | \n".colorize(:light_black)
  end

  def print_base
    puts " ----------------------------- ".colorize(:light_black)
    puts " |                           | ".colorize(:light_black)
    puts "_|_                         _|_".colorize(:light_black)
    puts ""
  end

  def prompt_user(player)
    @current_player = player
    print_prompt
    move = get_validate_column
    return move
  end

  def print_prompt
    print_errors

    output_str =  "Player #{@current_player.number}, your turn! "
    output_str += "Choose a column: "
    output_str =   output_str.colorize(@current_player.color.to_sym)
    print output_str
  end

  def print_errors
    if @errors.empty?
      puts ""
    else
      puts @errors.pop
    end
  end

  def get_validate_column
    loop do
      column = gets.chomp
      return column.to_i if (column.match?(/^[0-6]$/) && column.length == 1)
      @errors << "ERROR: Please choose a number between 0-6. Column must not be full."
      print_board
      print_prompt
    end
  end
end