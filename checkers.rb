
class Checkers
  attr_accessor :board, :players, :turn

  def initialize
    @board = Board.new
    @players = [HumanPlayer.new(:b), HumanPlayer.new(:w)]
    @turn = 0
  end

  def board
    @board
  end

  def play
    until game_over?
      print_board

      puts "Please enter start, intermediate, and end tiles of a piece."
      player_move = current_player.move_choice(board)
      puts "You chose #{player_move} as your move."

      player_move = player_move.map { |coord| internal_coord(coord) }

      # TODO: Do exception handling here?
      if valid_move?(player_move)
        execute_move(player_move)
        print_board
        go_to_next_turn
      end
    end

    puts @board.winner ? "#{@board.winner} has won!" : "Tie game!"
  end

  def valid_move?(player_move)
    # TODO: Call internal_notation to convert to array indices.
    true
  end

  def execute_move(player_move)
    from = player_move.first
    to = player_move.last

    @board[to] = @board[from]
    @board[from] = nil
    # TODO: Implement this.
  end

  def current_player
    @players[turn % 2]
  end

  def game_over?
    winner || tie?
  end

  def winner
    # TODO: Implement this.
    nil
  end

  def tie?
    # TODO: Implement this.
    false
  end

  def print_board
    puts " " + ('a'..'h').to_a.join(' ')
    @board.rows.each do |row|
      row.each do |square_contents|
        print " "
        print square_contents ? square_contents.render : "."
      end
      puts
    end

    nil
  end

  def internal_coord(coord)
    # TODO: Implement parsing of (letter/num) coords like "e3"
    coord
  end

  def go_to_next_turn
    @turn += 1
  end

end

class Board
  attr_accessor :rows, :winner

  def initialize
    set_new_game_config
  end

  def [](coord)
    @rows[coord[0]][coord[1]]
  end

  def []=(coord, value)
    self[coord] = value
  end

  def set_new_game_config
    @rows = []
    @rows[0] = [nil, Piece.new(:r), nil, Piece.new(:r), nil, Piece.new(:r), nil, Piece.new(:r)]
    @rows[1] = [Piece.new(:r), nil, Piece.new(:r), nil, Piece.new(:r), nil, Piece.new(:r), nil]
    @rows[2] = [nil, Piece.new(:r), nil, Piece.new(:r), nil, Piece.new(:r), nil, Piece.new(:r)]
    @rows[3] = [nil] * 8
    @rows[4] = [nil] * 8
    @rows[5] = [Piece.new(:w), nil, Piece.new(:w), nil, Piece.new(:w), nil, Piece.new(:w), nil]
    @rows[6] = [nil, Piece.new(:w), nil, Piece.new(:w), nil, Piece.new(:w), nil, Piece.new(:w)]
    @rows[7] = [Piece.new(:w), nil, Piece.new(:w), nil, Piece.new(:w), nil, Piece.new(:w), nil]
  end

# TODO: Figure out how to get this working.
=begin
  def each_row(&prc)
    p @rows
    @rows.each { |row| prc.call(row) }
  end
=end

end

class Piece
  attr_accessor :color, :crowned

  def initialize(color)
    @color = color
    @crowned = false
  end

  def render
    if @color == :r
      @crowned ? 'R' : 'r'
    else
      @crowned ? 'W' : 'w'
    end
  end

  def king_me
    @crowned = true
  end
end

=begin
class King < Piece
  # TODO: Implement this.
end
=end

class Player
  attr_accessor :color, :num_pieces

  def initialize(color)
    @color, @num_pieces = color, 12
  end
end

class HumanPlayer < Player

  def move_choice(board)
    # TODO: Figure out if I need to call chomp before split.
    from_and_to_coord = gets.split
  end

end

class ComputerPlayer < Player

  def move_choice(board)
    # TODO: Implement this.
  end

end
