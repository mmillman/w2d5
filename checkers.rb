
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

      puts "Please enter a move"
      player_move = current_player.move_choice(board)
      puts "You chose #{player_move}"

      player_move = player_move.map do |coord|
        internal_coord(coord)
      end

      # TODO: Do exception handling here?
      if valid_move?(player_move)
        execute_move(player_move)
        @turn += 1
      end
    end

    puts @board.winner ? "#{@board.winner} has won!" : "Tie game!"
  end

  def valid_move?(player_move)
    # TODO: Call internal_notation to convert to array indices.
    true
  end

  def execute_move(player_move)
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
    @board.rows.each do |row|
      row.each do |square_contents|
        print square_contents
        print "."
        square_contents ? square_contents.render : ". "
      end
    end

    nil
  end

  def internal_coord(coord)
    # TODO: Implement parsing of (letter/num) coords like "e3"
    coord
  end

end

class Board
  attr_accessor :rows, :winner

  def initialize
    @rows = empty_board
    set_up_pieces
  end

  def [](coord)
    @rows[coord[0]][coord[1]]
  end

  def []=(coord, value)
    self[coord] = value
  end

  def empty_board
    Array.new(8) { Array.new(8) }
  end

  def set_up_pieces
    @rows[0] = [nil, Piece.new(:r), nil, Piece.new(:r), nil, Piece.new(:r), nil, Piece.new(:r)]
    @rows[1] = [Piece.new(:r), nil, Piece.new(:r), nil, Piece.new(:r), nil, Piece.new(:r), nil]
    @rows[2] = [nil, Piece.new(:r), nil, Piece.new(:r), nil, Piece.new(:r), nil, Piece.new(:r)]

    @rows[5] = [Piece.new(:w), nil, Piece.new(:w), nil, Piece.new(:w), nil, Piece.new(:w), nil]
    @rows[6] = [nil, Piece.new(:w), nil, Piece.new(:w), nil, Piece.new(:w), nil, Piece.new(:w)]
    @rows[7] = [Piece.new(:w), nil, Piece.new(:w), nil, Piece.new(:w), nil, Piece.new(:w), nil]
  end

=begin
  def each_row(&prc)
    p @rows
    @rows.each { |row| prc.call(row) }
  end
=end

end

class Piece
  attr_accessor :color

  def initialize(color)
    @color = color
  end

  def render
    @color == :r ? 'R' : 'B'
  end
end

class King < Piece
  # TODO: Implement this.
end

class Player
  attr_accessor :color

  def initialize(color)
    @color = color
  end
end

class HumanPlayer < Player

  def move_choice(board)
    from_and_to_coord = gets.split
  end

end

class ComputerPlayer < Player

  def move_choice(board)
    # TODO: Implement this.
  end

end