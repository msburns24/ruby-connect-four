require_relative 'board'
require_relative 'display'
require_relative 'player'

class Game

  def initialize()
    # @turn = nil
    play_game 
  end

  def play_game
    # Setup board
    @board = Board.new()
    # @board.slots_from_json("data/test_board_no_win.json")

    # Setup player
    @player1 = Player.new(1, "red")

    # Setup display
    @display = Display.new(@board)

    # Loop to get move
    loop do
      @display.print_board
      move = @display.prompt_user(@player1)
      break if @board.add_piece(@player1.color, move)
      @display.errors << "ERROR: Please add to a column that is not full."
    end

    @display.print_board
    
  end
end