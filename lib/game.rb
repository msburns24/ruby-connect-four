require_relative 'board'
require_relative 'display'
require_relative 'player'

class Game

  def initialize()
    play_game 
  end

  def play_game
    # Setup board
    @board = Board.new()
    # @board.slots_from_json("data/test_board_no_win.json")

    # Setup players
    @player1 = Player.new(1, "red")
    @player2 = Player.new(2, "yellow")

    # Setup display
    @display = Display.new(@board)
    @display.print_welcome

    @current_player = @player1

    until @board.winner?
      # Loop to get move
      loop do
        @display.print_board
        move = @display.prompt_user(@current_player)
        break if @board.add_piece(@current_player.color, move)
        @display.errors << "ERROR: Please add to a column that is not full."
      end
      break if @board.tie?
      switch_player
    end
    
    if @board.tie?
      @display.print_board
      puts "It's a tie!"
    else
      @display.print_board
      outcome = @board.winner?
      winner = find_winner(outcome)
      puts "Player #{winner.number} wins!"
    end
      
  end

  def switch_player
    if @current_player.number == 1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def find_winner(color)
    if color == @player1.color
      return @player1
    else
      return @player2
    end
  end
end