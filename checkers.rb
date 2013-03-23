
class Checkers
  attr_accessor :board, :players, :turn

  def initialize
    @board = Board.new
    @players = [HumanPlayer.new(:b, "P1"), HumanPlayer.new(:w, "P2")]
    @turn = 0
  end

  def board
    @board
  end

  def play
    print_board

    until game_over?

      puts "#{current_player.name}'s move!"
      puts "Please enter start tile, all intermediate tiles, and end tile."
      player_move = current_player.move_choice(board)
      puts "You chose #{player_move} as your move."

      internal_move = player_move.map { |coord| board_index(coord) }

      # TODO: Do exception handling here?
      if valid_move?(internal_move)
        execute_move(internal_move)
        print_board
        go_to_next_turn
        # break # for debugging
      end
    end

    puts winner ? "#{winner} has won!" : "Tie game!"
  end

  def valid_move?(player_move)
    # TODO: Call internal_notation to convert to array indices.
    true
  end

  def execute_move(internal_move)
    from = internal_move.first
    to = internal_move.last

    @board[to] = @board[from]
    @board[from] = nil
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
    @board.rows.each_with_index do |row, row_num|
      print " #{8 - row_num}"
      row.each do |square_contents|
        print " "
        print square_contents ? square_contents.render : "."
      end
      puts
    end
    puts " " * 3 + ('a'..'h').to_a.join(' ')

    nil
  end

  def board_index(letter_num_coord)
    # TODO: Implement parsing of (letter/num) coords like "e3"
    x = letter_num_coord[0].downcase.ord % 97
    y = 8 - letter_num_coord[1].to_i
    [y, x]
  end

  def go_to_next_turn
    @turn += 1
  end

end

class Board
  attr_accessor :rows

  def initialize
    set_new_game_config
  end

  def [](coord)
    @rows[coord[0]][coord[1]]
  end

  def []=(coord, value)
    @rows[coord[0]][coord[1]] = value
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

  def can_jump_from?(position)

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
  attr_accessor :color, :name, :num_pieces

  def initialize(color, name = "Player")
    @color, @name, @num_pieces = color, name, 12
  end
end

class HumanPlayer < Player

  def initialize(color, name = "HumanPlayer")
    super
  end

  def move_choice(board)
    # TODO: Figure out if I need to call chomp before split.
    from_and_to_coord = gets.split
  end

end

class ComputerPlayer < Player

  def initialize(color, name = "ComputerPlayer")
    super
  end

  def move_choice(board)
    # TODO: Implement this.
  end

end
